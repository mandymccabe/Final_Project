pip install psycopg2

python setup.py build
sudo python setup.py install

conn = psycopg2.connect(
    host="localhost",
    database="suppliers",
    user="postgres",
    password="Abcd1234")