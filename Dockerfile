FROM python:3.9-slim

# Installer les dépendances nécessaires
RUN pip install --no-cache-dir mlflow

# Copier le script train.py dans l'image
COPY train.py /mlflow/train.py

# Définir le répertoire de travail
WORKDIR /mlflow

# Exposer le port utilisé par l'interface MLflow
EXPOSE 5000

# Lancer MLflow UI et exécuter le script de training
CMD ["sh", "-c", "python train.py && mlflow ui --host 0.0.0.0"]
