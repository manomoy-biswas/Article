User.new(name: "Admin User", email: "admin@example.com", mobile: "1234567890", dob: "01-01-2000", admin: true, password: "admin", password_confirmation: "admin").save(validate: false)