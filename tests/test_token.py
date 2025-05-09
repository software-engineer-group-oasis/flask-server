from app.utils.jwt_util import generate_token, decode_token

token = generate_token(4, "tenant")
print("Generated token:", token)

payload = decode_token(token)
print("Decoded payload:", payload)