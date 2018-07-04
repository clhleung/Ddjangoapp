from django.conf.urls import url
from stories import views

urlpatterns = [
    url(r'^$',views.HomePageView.as_view(),name='home'),
]
