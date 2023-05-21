from django.shortcuts import get_list_or_404, get_object_or_404

from .models import *

from rest_framework import status
from rest_framework.response import Response
from rest_framework.decorators import api_view, permission_classes
from rest_framework.permissions import IsAuthenticated
# Create your views here.

@api_view(['POST'])
def userinfo(request):
    if request.method == 'POST':
        print(request.data)
        # user = User.objects.get(username=request.data['username'])
        user = rq
        user.save(image=request.data.formData)
        
        return Response(status=status.HTTP_200_OK)
    return Response(status=status.HTTP_400_BAD_REQUEST)
