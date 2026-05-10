package com.medicore.common.exception;

import com.medicore.common.base.BaseResponse;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.ModelAndView;

import java.util.stream.Collectors;

@ControllerAdvice
public class GlobalExceptionHandler {

    @ExceptionHandler(AppException.class)
    public Object handleAppException(AppException ex, HttpServletRequest request) {
        if (isAjaxRequest(request)) {
            return ResponseEntity
                    .status(ex.getHttpStatus())
                    .body(BaseResponse.error(ex.getMessage()));
        }
        return createErrorView(ex.getMessage(), ex.getHttpStatus());
    }

    @ExceptionHandler(MethodArgumentNotValidException.class)
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    public Object handleValidationException(MethodArgumentNotValidException ex, HttpServletRequest request) {
        String message = ex.getBindingResult().getFieldErrors().stream()
                .map(e -> e.getField() + ": " + e.getDefaultMessage())
                .collect(Collectors.joining(", "));

        if (isAjaxRequest(request)) {
            return ResponseEntity.badRequest()
                    .body(BaseResponse.error(message));
        }
        return createErrorView(message, 400);
    }

    @ExceptionHandler(AccessDeniedException.class)
    public Object handleAccessDeniedException(AccessDeniedException ex, HttpServletRequest request) {
        if (isAjaxRequest(request)) {
            return ResponseEntity.status(HttpStatus.FORBIDDEN)
                    .body(BaseResponse.error("Bạn không có quyền truy cập"));
        }
        return createErrorView("Bạn không có quyền truy cập", 403);
    }

    @ExceptionHandler(Exception.class)
    public Object handleGenericException(Exception ex, HttpServletRequest request) {
        if (isAjaxRequest(request)) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body(BaseResponse.error("Lỗi máy chủ nội bộ"));
        }
        return createErrorView("Lỗi máy chủ nội bộ: " + ex.getMessage(), 500);
    }

    private boolean isAjaxRequest(HttpServletRequest request) {
        return "XMLHttpRequest".equals(request.getHeader("X-Requested-With"));
    }

    private ModelAndView createErrorView(String message, int status) {
        ModelAndView mav = new ModelAndView("error");
        mav.addObject("status", status);
        mav.addObject("message", message);
        mav.setStatus(HttpStatus.valueOf(status));
        return mav;
    }
}
