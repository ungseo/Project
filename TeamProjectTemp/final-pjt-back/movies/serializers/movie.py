from rest_framework import serializers
from ..models import Movie, Comment, Genre, Actor
from .user import UserSerializer
from .actor import ActorSerializer, ActorSerializer_name
from .genre import GenreSerializer


class MovieListSerializer(serializers.ModelSerializer):
    genres = GenreSerializer(many=True, read_only=True)
    actors = ActorSerializer_name(many=True, read_only=True)

    class Meta:
        model = Movie
        fields = '__all__'


class MovieSerializer(serializers.ModelSerializer):
    class CommentSerializer(serializers.ModelSerializer):
        user = UserSerializer(read_only=True)

        class Meta:
            model = Comment
            fields = ('user', 'content', 'created_at', 'updated_at',)
            
    genres = GenreSerializer(many=True, read_only=True)
    comments = CommentSerializer(many=True, read_only=True)
    actors = ActorSerializer(many=True, read_only=True)
    
    class Meta:
        model = Movie
        fields = '__all__'