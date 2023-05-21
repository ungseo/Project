from rest_framework import serializers
from ..models import Actor

class ActorListSerializer(serializers.ModelSerializer):
    class Meta:
        model = Actor
        fields = ('id', 'name')


class ActorSerializer(serializers.ModelSerializer):
    class Meta:
        model = Actor
        fields = ('id', 'name', 'profile_path',)


class ActorSerializer_name(serializers.ModelSerializer):
    class Meta:
        model = Actor
        fields = ('name',)