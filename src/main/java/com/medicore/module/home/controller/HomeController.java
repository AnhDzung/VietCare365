package com.medicore.module.home.controller;

import com.medicore.module.doctor.dto.DoctorResponse;
import com.medicore.module.doctor.service.DoctorService;
import com.medicore.module.home.dto.ConsultationRequest;
import com.medicore.module.patient.entity.Patient;
import com.medicore.module.patient.repository.PatientRepository;
import com.medicore.module.user.entity.User;
import com.medicore.module.user.repository.UserRepository;
import jakarta.validation.Valid;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.security.SecureRandom;
import java.util.List;

@Controller
@RequestMapping({"/", "/home"})
public class HomeController {

    private final DoctorService doctorService;
    private final UserRepository userRepository;
    private final PatientRepository patientRepository;
    private final PasswordEncoder passwordEncoder;

    private static final SecureRandom RANDOM = new SecureRandom();
    private static final String PASSWORD_ALPHABET = "ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnpqrstuvwxyz23456789";

    public HomeController(DoctorService doctorService,
                          UserRepository userRepository,
                          PatientRepository patientRepository,
                          PasswordEncoder passwordEncoder) {
        this.doctorService = doctorService;
        this.userRepository = userRepository;
        this.patientRepository = patientRepository;
        this.passwordEncoder = passwordEncoder;
    }

    @GetMapping
    public String index(Model model) {
        populateCommonModel(model);
        if (!model.containsAttribute("intake")) {
            model.addAttribute("intake", new ConsultationRequest());
        }

        return "home/home";
    }

    @PostMapping("/consultation")
    @Transactional
    public String consultation(@Valid @ModelAttribute("intake") ConsultationRequest intake,
                               BindingResult bindingResult,
                               Model model) {
        populateCommonModel(model);

        if (bindingResult.hasErrors()) {
            model.addAttribute("intakeError", "Vui lòng kiểm tra lại các trường bắt buộc.");
            return "home/home";
        }

        String username = intake.getPhone().trim();
        if (userRepository.findByUsername(username).isPresent()) {
            model.addAttribute("intakeError", "Số điện thoại này đã được sử dụng để tạo tài khoản.");
            return "home/home";
        }

        if (intake.getEmail() != null && !intake.getEmail().isBlank()) {
            if (userRepository.existsByEmailIgnoreCase(intake.getEmail().trim())) {
                model.addAttribute("intakeError", "Email này đã tồn tại trong hệ thống.");
                return "home/home";
            }
        }

        String tempPassword = generatePassword(10);

        User user = new User();
        user.setUsername(username);
        user.setEmail(normalize(intake.getEmail()));
        user.setFullName(intake.getFullName().trim());
        user.setRole(User.Role.PATIENT);
        user.setActive(true);
        user.setPassword(passwordEncoder.encode(tempPassword));
        User savedUser = userRepository.save(user);

        Patient patient = new Patient();
        patient.setFullName(intake.getFullName().trim());
        patient.setPhone(username);
        patient.setEmail(normalize(intake.getEmail()));
        patient.setAddress(normalize(intake.getAddress()));
        patient.setUserId(savedUser.getId());
        patientRepository.save(patient);

        model.addAttribute("intakeSuccess", "Cảm ơn bạn đã gửi thông tin. Hệ thống đã tạo tài khoản cho bạn.");
        model.addAttribute("generatedUsername", username);
        model.addAttribute("generatedPassword", tempPassword);
        model.addAttribute("intake", new ConsultationRequest());

        return "home/home";
    }

    private void populateCommonModel(Model model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        boolean isAuthenticated = auth != null && auth.isAuthenticated() && !"anonymousUser".equals(auth.getPrincipal());
        boolean isPatient = isAuthenticated && auth.getAuthorities().stream().anyMatch(a -> a.getAuthority().equals("ROLE_PATIENT") || a.getAuthority().equals("PATIENT"));
        boolean isDoctor = isAuthenticated && auth.getAuthorities().stream().anyMatch(a -> a.getAuthority().equals("ROLE_DOCTOR") || a.getAuthority().equals("DOCTOR"));
        boolean isAdmin = isAuthenticated && auth.getAuthorities().stream().anyMatch(a -> a.getAuthority().equals("ROLE_ADMIN") || a.getAuthority().equals("ADMIN"));

        model.addAttribute("isAuthenticated", isAuthenticated);
        model.addAttribute("isPatient", isPatient);
        model.addAttribute("isDoctor", isDoctor);
        model.addAttribute("isAdmin", isAdmin);
        model.addAttribute("username", isAuthenticated ? auth.getName() : null);
        model.addAttribute("topDoctors", doctorService.getAll(PageRequest.of(0, 5, Sort.by(Sort.Direction.DESC, "createdAt"))).getContent());
    }

    private String normalize(String value) {
        if (value == null) {
            return null;
        }
        String trimmed = value.trim();
        return trimmed.isEmpty() ? null : trimmed;
    }

    private String generatePassword(int length) {
        StringBuilder builder = new StringBuilder(length);
        for (int index = 0; index < length; index++) {
            builder.append(PASSWORD_ALPHABET.charAt(RANDOM.nextInt(PASSWORD_ALPHABET.length())));
        }
        return builder.toString();
    }
}
