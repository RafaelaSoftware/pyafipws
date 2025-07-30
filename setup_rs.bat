@echo off

rem Instalación y registración de las dependencias para el proyecto PyAfipWs

echo *** Instalar utilidades de instalacion / entorno virtual:

rem Generar un entorno virtual

pip install --upgrade pip
pip install --upgrade virtualenv
pip install --upgrade setuptools wheel
pip install --upgrade cachetools pefile

echo *** Crear y activar el entorno virtual venv (en el directorio actual):
virtualenv venv
call venv\Scripts\activate.bat

echo *** Instalar el paquete en modo editable:
pip install -e .

echo *** Instalando dependencias del proyecto:
pip install -r requirements.txt
pip install -r requirements-dev.txt

echo *** Instalar las dependencias binarias (precompiladas):
pip install http://www.sistemasagiles.com.ar/soft/pyafipws/M2Crypto-0.22.3-cp27-none-win32.whl
pip install http://www.sistemasagiles.com.ar/soft/pyafipws/pywin32-219-cp27-none-win32.whl

echo *** Registrando componentes...
python wsaa.py --register
python wsfev1.py --register
python wsfexv1.py --register
python wsbfev1.py --register
python wscdc.py --register

echo *** Listo!

pause
