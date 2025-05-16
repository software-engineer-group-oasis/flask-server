from openai import OpenAI
from app.config import Config

client = OpenAI(api_key=Config.DEEPSEEK_API_KEY, base_url='https://api.deepseek.com')

def chat_with_deepseek(message):
    response = client.chat.completions.create(
        model="deepseek-chat",
        messages=[
            {"role": "system", "content": "You are a helpful assistant in house rental domain. please analyze the json data and provide the answer."},
            {"role": "user", "content": message}
        ]
    )
    return response.choices[0].message.content

if __name__ == '__main__':
    print(chat_with_deepseek("请简要介绍一下deepseek的产品"))