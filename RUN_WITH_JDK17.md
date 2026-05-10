Hướng dẫn: Chạy dự án với JDK 17/21 khi hệ thống mặc định là JDK khác

1) Cài JDK 17 hoặc JDK 21 nếu chưa cài.
2) Copy `toolchains-sample.xml` vào file cấu hình Maven của bạn:
   - Windows: `%USERPROFILE%\.m2\toolchains.xml`
   - Linux/Mac: `~/.m2/toolchains.xml`
   - Thay nội dung `<jdkHome>` trong file bằng đường dẫn chính xác tới thư mục cài JDK (ví dụ `C:\Program Files\Java\jdk-17`).

3) Chạy Maven như bình thường từ thư mục dự án:
```bash
cd D:\VietCare365
mvn spring-boot:run
```

Ghi chú:
- `maven-toolchains-plugin` trong `pom.xml` sẽ lựa JDK đã khai báo để biên dịch và cho các plugin tương thích.
- Nếu `spring-boot:run` vẫn khởi động bằng JDK hệ thống, bạn có thể tạm thời thay `JAVA_HOME` trong cùng shell:
```cmd
set JAVA_HOME=C:\Program Files\Java\jdk-17
set PATH=%JAVA_HOME%\bin;%PATH%
mvn spring-boot:run
```

Nếu bạn muốn, tôi có thể tìm trên máy các thư mục JDK khả dĩ và gợi ý giá trị `jdkHome` phù hợp.