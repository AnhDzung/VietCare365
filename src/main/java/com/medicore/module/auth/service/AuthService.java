package com.medicore.module.auth.service;

import com.medicore.module.auth.dto.LoginRequest;

public interface AuthService {
    boolean authenticate(LoginRequest request);
}
