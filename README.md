
Author: Jocelyn Alsdorf
Program name: Hair Salon App
Description: This app allows a user to manage stylists and clients.
The user can create, update and delete stylists and assign clients to 
specific stylists. (psql/postgres used)

Set-up Instructions:

Ruby

The gems used:
gem('sinatra')
gem('sinatra-contrib')
gem('rspec')
gem('capybara')
gem('pry')
gem('pg')


database client: postgres psql

psql
----------------------------------------------------------------------------------

username=# CREATE DATABASE hair_salon;

username=# \c hair_salon;

hair_salon=# CREATE TABLE stylists (id serial PRIMARY KEY, name varchar);

hair_salon=# CREATE TABLE clients (id serial PRIMARY KEY, client_description varchar, stylist_id int);

hair_salon=# CREATE DATABASE hair_salon_test WITH TEMPLATE hair_salon;

------------------------------------------------------------------------------------

Copying/license:
The MIT License (MIT)

Copyright (c) 2015 Jocelyn Alsdorf

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
