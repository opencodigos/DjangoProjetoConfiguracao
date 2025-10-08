# Django 5 - Configuração de Projeto (Simples)

Atualizado - 10/2025

Essa configuração simples de projeto django que utilizo para fazer testes e criar aplicações locais.

Espero que ajude !!!

Esse é link do Vídeo Tutorial [Link](https://youtu.be/x6WX2zwXj-Y) 

<details>
<summary>*Ambiente Virtual Linux/Windows*</summary>
    
    Lembrando… Precisa ter Python instalado no seu ambiente.
    
    **Criar o ambiente virtual Linux/Windows**
    
    ```python
    ## Windows
    python -m venv .venv
    source .venv/Scripts/activate # Ativar ambiente
    
    ## Linux 
    ## Caso não tenha virtualenv. "pip install virtualenv"
    virtualenv .venv
    source .venv/bin/activate # Ativar ambiente
    ```
    
    Instalar os seguintes pacotes.
    
    ```python
    pip install django
    pip install pillow
    ```
    
    Para criar o arquivo *requirements.txt*
    
    ```python
    pip freeze > requirements.txt
    ```
</details>
<details>
<summary>*Criando o Projeto*</summary>  
    “core” é nome do seu projeto e quando colocamos um “.” depois do nome do projeto significa que é para criar os arquivos na raiz da pasta. Assim não cria subpasta do projeto.
    
    ```python
    django-admin startproject core .
    ```
    
    **Testar a aplicação**
    
    ```python
    python manage.py runserver
    ```
</details>
<details>
<summary>*Configurar Settings e Arquivos Static*</summary>  
    
    Perfeito 👇 aqui está **tudo numerado e organizado** pra copiar direto:
    
    ---
    
    ### **Achar pasta `templates`**
    
    ```python
    # Templates
    'DIRS': [TEMPLATES_DIR := BASE_DIR / 'templates'],
    ```
    
    ---
    
    ### **Rotas de autenticação**
    
    ```python
    # Autenticação
    LOGIN_REDIRECT_URL = '/'
    LOGOUT_REDIRECT_URL = '/'
    ```
    
    ---
    
    ### **Arquivos estáticos / mídia**
    
    ```python
    # Arquivos estáticos
    STATIC_URL = '/static/'
    STATICFILES_DIRS = [BASE_DIR / 'static']
    
    # Usado apenas em produção para collectstatic
    # STATIC_ROOT = BASE_DIR / 'staticfiles'
    
    # Arquivos de mídia
    MEDIA_URL = '/media/'
    MEDIA_ROOT = BASE_DIR / 'media'
    ```
    
    ---
    
    ### **Traduções**
    
    ```python
    # Traduções
    LOCALE_PATHS = [BASE_DIR / 'locale']
    ```
    
    ---
    
    ### **Internacionalização**
    
    ```python
    # Internacionalização
    LANGUAGE_CODE = 'pt-br'
    TIME_ZONE = 'America/Sao_Paulo'
    USE_I18N = True
    USE_L10N = True
    USE_TZ = True
    ```
    
    ---
    
    ### **Configuração de e-mail**
    
    ```python
    # Configuração de e-mail
    DEFAULT_FROM_EMAIL = 'noreply@seudominio.com'
    EMAIL_BACKEND = 'django.core.mail.backends.console.EmailBackend'
    
    ```
    
    ---
    
    *myapp/urls.py*
    
    ```python
    from django.contrib import admin 
    from django.urls import path, include
    
    from django.conf import settings
    from django.conf.urls.static import static
    
    urlpatterns = [
        path('admin/', admin.site.urls), 
    ] 
    
    # Somente Quando Debug é True.
    if settings.DEBUG:  
        urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
        urlpatterns += static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)
    
    ```
</details>
<details>
<summary>*Criando Aplicativo*</summary>   
    
    **Vamos criar nosso aplicativo no Django.**
    
    Para criar a aplicação no Django rode comando abaixo. “myapp” é nome do seu App.
    
    ```python
    python manage.py startapp myapp
    ```
    
    Agora precisamos registrar nossa aplicação no *INSTALLED_APPS* localizado em *settings.py*.
</details>
<details>
<summary>*Template base e Bootstrap Configuração*</summary>  
    ### Bootstrap configuração
    
    Doc: https://getbootstrap.com/docs/5.2/getting-started/introduction/
    
    Com Base na documentação para utilizar os recursos Boostrap basta adicionar as tags de CSS e JS. No HTML da Pagina Base.
    
    ```python
    <!-- CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
    
    <!-- JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
    
    ```
    
    ## Template Base
    
    1 - criar um arquivo base ***base.html*** onde vamos renderizar nosso conteúdo. 
    
    ```html
    {% load static %}
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>{% block title %}Django Site{% endblock %}</title>
    
        <meta name="viewport" content="width=device-width, initial-scale=1">
     
        <link rel="icon" href="{% static 'images/favicon.ico' %}" type="image/x-icon">
    
        <!-- Bootstrap CSS (v5) -->
    		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
    
        <!-- Font Awesome (v6) -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
        
        <link rel="stylesheet" href="{% static 'css/styles.css' %}">
    
        {% block extra_head %}{% endblock %}
    </head>
    <body> 
    		
    		<nav class="navbar navbar-expand-lg navbar-light bg-light mb-4">
            <div class="container">
                <a class="navbar-brand" href="#index"><i class="fa-solid fa-leaf"></i> Django Site</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="#index"><i class="fas fa-home"></i> Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#"><i class="fas fa-info-circle"></i> Sobre</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#"><i class="fas fa-envelope"></i> Contato</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    
        <div class="container">
            {% block content %} 
            {% endblock %}
        </div>
    
        <!-- jQuery (v3) -->
        <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    
        <!-- Bootstrap JS Bundle -->
    		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
    
        {% block extra_js %}{% endblock %}
    </body>
    </html>
    ```
    
    Messages
    
    ---
    
    ### **Configuração de mensagens (para Bootstrap)**
    
    ```python
    from django.contrib.messages import constants as messages
    
    MESSAGE_TAGS = {
        messages.DEBUG: 'secondary',
        messages.INFO: 'info',
        messages.SUCCESS: 'success',
        messages.WARNING: 'warning',
        messages.ERROR: 'danger',
    }
    
    ```
    
    ---
    
    ```html
    {% if messages %}
    {% for message in messages %}
    <div class="alert alert-{{ message.tags }} alert-dismissible fade show" role="alert">
    {{ message }}
    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
    {% endfor %}
    {% endif %}
    ```
</details>
<details>
<summary>*Cria uma View*</summary>   
    
    Doc Herança de Template: https://docs.djangoproject.com/en/5.2/ref/templates/language/
    
    *index.html*
    
    ```html
    {% extends "base.html" %}
    {% load static %} 
    {% block title %}Home - Django Site{% endblock %}
    {% block content %} 
    <h1>Página teste 1</h1> 
    <p>Bem-vindo ao meu site Django!</p>
    {% endblock %}
    ```
    
    *myapp/views.py*
    
    ```python
    from django.shortcuts import render
    
    # Create your views here.
    def index(request):
        return render(request, 'index.html')
    ```
    
    criar arquivo *myapp*/*urls.py*
    
    ```
    from django.urls import path
    from .views import index
    
    urlpatterns = [
        path('', index, name='index'),
    ]
    ```
    
    urls.py do projeto. ***core/urls.py***
    
    ```python
    path('', include('myapp.urls')), # url do app
    ```
    
    Rodar o projeto para ver como está.
    
    ```python
    python manage.py makemigrations
    python manage.py migrate
    python manage.py createsuperuser
    python manage.py runserver
    ```
    
    .gitignore
    
    ```python
    /tmp 
    .venv
    db.sqlite3
    /media
    media
    /static_files
    static_files
    __pycache__ 
    __pycache__/
    ```
</details> 