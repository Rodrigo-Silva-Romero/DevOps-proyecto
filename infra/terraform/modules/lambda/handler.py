import smtplib
import os

def lambda_handler(event, context):
    sender = os.environ["SENDER_EMAIL"]
    app_password = os.environ["APP_PASSWORD"]
    receiver = "rodrigosilvaromero14@gmail.com"
    environment = os.environ.get("ENVIRONMENT", "desconocido")

    subject = f"Infra desplegada correctamente en {environment}"
    body = f"La infraestructura para el entorno {environment} se levanto correctamente con el pipeline."

    message = f"Subject: {subject}\n\n{body}"

    try:
        with smtplib.SMTP("smtp.gmail.com", 587) as server:
            server.starttls()
            server.login(sender, app_password)
            server.sendmail(sender, receiver, message)

        return {"statusCode": 200, "body": "Email enviado correctamente."}

    except Exception as e:
        print("Error enviando email:", e)
        return {"statusCode": 500, "body": str(e)}
