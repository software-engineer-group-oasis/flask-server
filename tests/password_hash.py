from werkzeug.security import generate_password_hash, check_password_hash

n = 16

data = ['123456' for _ in range(n)]

password = [generate_password_hash(i, method='pbkdf2:sha256', salt_length=8) for i in data ]
for i in password:
    print(i)

for i in password:
    print(check_password_hash(i, '123456'))