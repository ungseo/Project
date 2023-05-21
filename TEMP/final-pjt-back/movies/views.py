from django.shortcuts import get_list_or_404, get_object_or_404

from rest_framework import status
from rest_framework.response import Response
from rest_framework.decorators import api_view, permission_classes
from rest_framework.permissions import IsAuthenticated

from .serializers.genre import GenreSerializer
from .serializers.movie import MovieListSerializer, MovieSerializer
from .serializers.comment import CommentListSerializer, CommentSerializer

from .models import Genre, Movie, Comment


# 영화 리스트
@api_view(['GET'])
# @permission_classes([IsAuthenticated])
def movie_list(request):
    if request.method == 'GET':
        movies = get_list_or_404(Movie)
        serializer = MovieListSerializer(movies, many=True)
        return Response(serializer.data, status=status.HTTP_200_OK)


# 영화 자세히
@api_view(['GET'])
# @permission_classes([IsAuthenticated])
def movie_detail(request, movie_pk):
    if request.method == 'GET':
        movie = get_object_or_404(Movie, pk=movie_pk)
        serializer = MovieSerializer(movie)
        return Response(serializer.data, status=status.HTTP_200_OK)
    

# comment list
@api_view(['GET'])
# @permission_classes([IsAuthenticated])
def comment_list(request):
    if request.method == 'GET':
        comments = get_list_or_404(Comment)
        serializer = CommentListSerializer(comments, many=True)
        return Response(serializer.data, status=status.HTTP_200_OK)
    

# comment detail
@api_view(['GET', 'PUT', 'DELETE'])
# @permission_classes([IsAuthenticated])
def comment_detail(request, comment_pk):
    comment = get_object_or_404(Comment, pk=comment_pk)
    
    if request.method == 'GET':
        serializer = CommentSerializer(comment)
        return Response(serializer.data, status=status.HTTP_200_OK)
    
    elif request.method == 'PUT':
        if request.user == comment.user:
            serializer = CommentSerializer(comment, data=request.data)
            if serializer.is_valid(raise_exception=True):
                serializer.save()
                return Response(serializer.data, status=status.HTTP_202_ACCEPTED)
        else:
            data = {
                'update': False,
                'description': "로그인한 유저가 작성한 댓글이 아닙니다!"
            }
            return Response(data, status=status.HTTP_401_UNAUTHORIZED)
    
    elif request.method == 'DELETE':
        if request.user == comment.user:
            comment.delete()
            data = {
                'delete': False,
                'description': f"comment {comment_pk} is deleted"
            }
            return Response(data, status=status.HTTP_204_NO_CONTENT)
        else:
            data = {
                'delete': False,
                'description': "로그인한 유저가 작성한 댓글이 아닙니다!"
            }
            return Response(data, status=status.HTTP_401_UNAUTHORIZED)
        

@api_view(['POST'])
# @permission_classes([IsAuthenticated])
def create_comment(request, movie_pk):
    movie = get_object_or_404(Movie, pk=movie_pk)
    serializer = CommentSerializer(request.data)
    if serializer.is_valid(raise_exception=True):
        serializer.save(movie=movie, user=request.user)
        return Response(serializer.data, status=status.HTTP_201_CREATED)