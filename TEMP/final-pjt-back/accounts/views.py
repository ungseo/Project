from django.shortcuts import get_list_or_404, get_object_or_404

from .models import *

from rest_framework import status
from rest_framework.response import Response
from rest_framework.decorators import api_view, permission_classes
from rest_framework.permissions import IsAuthenticated
# Create your views here.

@api_view(['POST', 'GET'])
def userinfo(request):
    if request.method == 'POST':
        username = request.data.get('username')
        uploaded_file = request.data.get('file')
        file_path = 'final-pjt-back/media/profile_images/' + uploaded_file.name

        user = User.objects.get(username=username)
        user.image = uploaded_file
        user.image_path = file_path
        user.save()
        print(file_path)
        return Response({ 'image_path': file_path },status=status.HTTP_200_OK)
    return Response(status=status.HTTP_400_BAD_REQUEST)
