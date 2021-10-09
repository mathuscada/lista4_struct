# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Teacher.create([{name: 'Pedro Afonso', email: 'pedroaf@unb.br', birth_date: '1970-09-27'}, {name: 'Renato Jorge', email: 'renatojg@unb.br', birth_date: '1959-01-01'}])
Language.create([{name: 'python', teacher_id: 1}, {name: 'c', teacher_id: 2}])
Student.create([{name: 'Matheus', matricula: '211112323', email: 'matheusbt@gmail.com', birth_date: '2001-10-05', teacher_id: 2},
    {name: 'Lucas', matricula: '201890102', email: 'lucaslucas@aluno.unb.br', birth_date: '2003-08-13', teacher_id: 1},
    {name: 'Jéssica', matricula: '200014598', email: '200014598@aluno.unb.br', birth_date: '2000-02-29', teacher_id: 1},
    {name: 'Dom Pedro 3', matricula: '150012314', email: 'domp2@outlook.com', birth_date: '1999-09-07', teacher_id: 1},
    {name: 'Xuxa', matricula: '190121122', email: 'rainhadosbaixinhos@gmail.com', birth_date: '2002-06-30', teacher_id: 2}])

Admin.create(email: "apcadmin@unb.br", password: "123456")