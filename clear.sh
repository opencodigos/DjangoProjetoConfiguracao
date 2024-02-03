## Limpa arquivos migrations e cache.
find . -type d -name __pycache__ -delete  
find . -path "*/migrations/*.py" -not -name "__init__.py" -delete
find . -path "*/migrations/*.pyc"  -delete