from django.db import models
from storages.backends.gcloud import GoogleCloudStorage


storage = GoogleCloudStorage()

class Upload:

    @staticmethod
    def upload_file(file, filename):
        try:
            target_path = '/raports/' + filename
            path = storage.save(target_path, file)
            return storage.url(path)
        except Exception as e:
            print("Failed to upload!")

# Create your models here.
