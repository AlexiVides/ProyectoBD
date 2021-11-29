Create database Veterinaria_Proyecto

use Veterinaria_Proyecto


Create table departamento (
Id_Dep int primary key identity (1,1) not null,
NombreDepart varchar(50) not null,
);

insert into departamento(NombreDepart) values ('Chalatenango')

create table municipio(
id_Municipio int primary key identity (1,1) not null,
NombreMuni varchar(50) not null,
Id_Departament int foreign key references departamento(Id_Dep)
);

insert into municipio(NombreMuni, Id_Departament ) values ('Chalatenango',1)
insert into municipio(NombreMuni, Id_Departament) values ('Agua Caliente',1)
insert into municipio(NombreMuni, Id_Departament) values ('Arcatao',1)
insert into municipio(NombreMuni, Id_Departament) values ('Azacualpa',1)
insert into municipio(NombreMuni, Id_Departament) values ('Citalá',1)
insert into municipio(NombreMuni, Id_Departament) values ('Comalapa',1)
insert into municipio(NombreMuni, Id_Departament) values ('Concepción Quezaltepeque',1)
insert into municipio(NombreMuni, Id_Departament) values ('Dulce Nombre de María',1)
insert into municipio(NombreMuni, Id_Departament) values ('El Carrizal',1)
insert into municipio(NombreMuni, Id_Departament) values ('El Paraíso',1)
insert into municipio(NombreMuni, Id_Departament) values ('La Laguna',1)
insert into municipio(NombreMuni, Id_Departament) values ('La Palma',1)
insert into municipio(NombreMuni, Id_Departament) values ('La Reina',1)
insert into municipio(NombreMuni, Id_Departament) values ('Las Vueltas',1)
insert into municipio(NombreMuni, Id_Departament) values ('Nombre de Jesús',1)
insert into municipio(NombreMuni, Id_Departament) values ('Nueva Concepción',1)
insert into municipio(NombreMuni, Id_Departament) values ('Nueva Trinidad',1)
insert into municipio(NombreMuni, Id_Departament) values ('Ojos de Agua',1)
insert into municipio(NombreMuni, Id_Departament) values ('Potonico',1)
insert into municipio(NombreMuni, Id_Departament) values ('San Antonio de La Cruz',1)
insert into municipio(NombreMuni, Id_Departament) values ('San Antonio Los Ranchos',1)
insert into municipio(NombreMuni, Id_Departament) values ('San Fernando',1)
insert into municipio(NombreMuni, Id_Departament) values ('San Francisco Lempa',1)
insert into municipio(NombreMuni, Id_Departament) values ('San Francisco Morazán',1)
insert into municipio(NombreMuni, Id_Departament) values ('San Ignacio',1)
insert into municipio(NombreMuni, Id_Departament) values ('San Isidro Labrador',1)
insert into municipio(NombreMuni, Id_Departament) values ('San José Cancasque',1)
insert into municipio(NombreMuni, Id_Departament) values ('San José Las Flores',1)
insert into municipio(NombreMuni, Id_Departament) values ('San Luis del Carmen',1)
insert into municipio(NombreMuni, Id_Departament) values ('San Miguel de Mercedes',1)
insert into municipio(NombreMuni, Id_Departament) values ('San Rafael',1)
insert into municipio(NombreMuni, Id_Departament) values ('Santa Rita',1)
insert into municipio(NombreMuni, Id_Departament) values ('Tejutla',1)

select m.id_Municipio, m.NombreMuni, d.NombreDepart
from municipio as m
inner join departamento as d
on m.Id_Departament = d.Id_Dep


Create table direccion(
Id_Direccion int primary key identity (1,1) not null,
D_direccion varchar(50) not null,
Cod_Postal int not null,
Id_Mucipio int foreign key references municipio(id_Municipio) not null
);

insert into direccion(D_direccion, Cod_Postal, Id_Mucipio) values ('Avenida Republica', 90872, 1)
insert into direccion(D_direccion, Cod_Postal, Id_Mucipio) values ('Calle Constitucion', 79032, 4)
insert into direccion(D_direccion, Cod_Postal, Id_Mucipio) values ('Avenida EL Carmen', 23112, 5)

select * from direccion

select d.D_direccion, d.Cod_Postal, m.NombreMuni
from direccion as d
inner join municipio as m on d.Id_Mucipio = m.id_Municipio

Create table Telefono (
Id_Telefono int primary key identity (1,1) not null,
Codigo_Area int not null,
Num_Telefono int unique not null
);

insert into Telefono(Codigo_Area, Num_Telefono) values (503, 70983412)
insert into Telefono(Codigo_Area, Num_Telefono) values (503, 62234176)
insert into Telefono(Codigo_Area, Num_Telefono) values (503, 71091234)

select * from Telefono


Create table Dueño (
Id_dueno int primary key identity (1,1) not null,
Dui int  not null,
Nombre_Dueño varchar(50) not null,
Apellidos_Dueño varchar(50) not null,
Id_Direccion int foreign key references direccion(Id_Direccion) not null,
Id_Telefono int foreign key references Telefono(Id_Telefono) not null
);

insert into Dueño(Dui, Nombre_Dueño, Apellidos_Dueño, Id_Direccion, Id_Telefono)
values (198217628, 'Antonio', 'Castro', 2, 1)
insert into Dueño(Dui, Nombre_Dueño, Apellidos_Dueño, Id_Direccion, Id_Telefono)
values (345526719, 'Felipe', 'Hernandez', 1, 2)
insert into Dueño(Dui, Nombre_Dueño, Apellidos_Dueño, Id_Direccion, Id_Telefono)
values (278312410, 'Rene', 'Guardado', 3, 3)

select * from Dueño

select d.Dui, d.Nombre_Dueño, d.Apellidos_Dueño, di.D_direccion, t.Num_Telefono
from Dueño as d
inner join direccion as di on d.Id_Direccion = di.Id_Direccion
inner join Telefono as t on d.Id_Telefono = t.Id_Telefono

--------------------------------------------------------------------------------------

Create table Tipo_Mascota(
Id_tipoMascota int primary key identity (1,1) not null,
TipoMascota varchar(50) not null
);

insert into Tipo_Mascota(TipoMascota) values ('Gato')
insert into Tipo_Mascota(TipoMascota) values ('Perro')
insert into Tipo_Mascota(TipoMascota) values ('Perro')

select * from Tipo_Mascota

Create table Raza_Mascota(
Id_razaMascota int primary key identity (1,1) not null,
RazaMascota varchar (50) not null
);

insert into Raza_Mascota(RazaMascota) values ('Bengala')
insert into Raza_Mascota(RazaMascota) values ('Pitbull')
insert into Raza_Mascota(RazaMascota) values ('Labrador')

select * from Raza_Mascota

Create table Descrip_Mascota(
Id_Descrip int primary key identity (1,1) not null,
Tamaño_m float not null,
Edad_m int not null,
Color_m varchar(50) not null,
Comida_fav varchar(50) not null,
Id_tipoMascota int foreign key references Tipo_Mascota(Id_tipoMascota) not null,
Id_razaMascota int foreign key references Raza_Mascota(Id_razaMascota) not null
);

insert into Descrip_Mascota(Tamaño_m, Edad_m, Color_m, Comida_fav, Id_tipoMascota, Id_razaMascota)
values (0.61, 8, 'Blanco', 'Pescado', 1, 1)
insert into Descrip_Mascota(Tamaño_m, Edad_m, Color_m, Comida_fav, Id_tipoMascota, Id_razaMascota)
values (0.82, 14, 'Negro', 'Carne', 3, 3)
insert into Descrip_Mascota(Tamaño_m, Edad_m, Color_m, Comida_fav, Id_tipoMascota, Id_razaMascota)
values (0.97, 16, 'Cafe', 'Pescado', 2, 2)

select * from Descrip_Mascota

select dm.Tamaño_m, dm.Edad_m, dm.Color_m, dm.Comida_fav, t.TipoMascota, r.RazaMascota
from Descrip_Mascota as dm
inner join Tipo_Mascota as t on dm.Id_tipoMascota = t.Id_tipoMascota
inner join Raza_Mascota as r on dm.Id_razaMascota = r.Id_razaMascota


Create table Mascota(
Id_Mascota int primary key identity (1,1) not null,
Nombre_Mascota varchar(50) not null,
F_Nacimiento date not null,
Observacion varchar(50) not null,
Id_Descrip int foreign key references Descrip_Mascota(Id_Descrip) not null,
Id_Dueño int foreign key references Dueño(Id_dueno) not null,
);

insert into Mascota(Nombre_Mascota, F_Nacimiento, Observacion, Id_Descrip, Id_Dueño)
values ('Patitas', '2021/03/26', 'Muy fuerte y sano', 1, 4)
insert into Mascota(Nombre_Mascota, F_Nacimiento, Observacion, Id_Descrip, Id_Dueño)
values ('Kyra', '2020/09/29', 'Se muestra muy debil', 2, 5)
insert into Mascota(Nombre_Mascota, F_Nacimiento, Observacion, Id_Descrip, Id_Dueño)
values ('Firu', '2020/07/12', 'Se encuentra en estado critico', 3, 6)

select * from Mascota

select m.Nombre_Mascota, m.F_Nacimiento, m.Observacion, ds.Edad_m, d.Nombre_Dueño
from Mascota as m
inner join Descrip_Mascota as ds on m.Id_Descrip = ds.Id_Descrip
inner join Dueño as d on m.Id_Dueño = d.Id_dueno


------------------------------------------------------------------------------------------------

create table Users(
Id_User int primary key identity (1,1) not null,
Name_User varchar(50) unique not null,
Pass varchar(25) not null
);

insert into Users(Name_User, Pass) values ('Crst1020@gmail.com', 'Cris2020')
insert into Users(Name_User, Pass) values ('Javier01@gmail.com', 'Jvr09')
insert into Users(Name_User, Pass) values ('Stago2020@gmail.com', 'St12')

select * from Users

create table Cargo(
Id_Cargo int primary key identity (1,1) not null,
CargoV varchar(100) not null
);


Insert into Cargo(CargoV) values ('Jefe de Quirofano')
Insert into Cargo(CargoV) values ('Encargado area de Fisioterapia')
Insert into Cargo(CargoV) values ('Nutricionista')

select * from Cargo

create table Especialidad(
Id_Especialidad int primary key identity (1,1) not null,
EspecialidadV varchar(100) not null
);

insert into Especialidad(EspecialidadV) values('Cirujia')
insert into Especialidad(EspecialidadV) values('Terapeuta fisico')
insert into Especialidad(EspecialidadV) values('Nutriologo')

select * from Especialidad

Create table Veterinario (
Cod_Veterinario int primary key identity(1,1) not null,
Nombre_Veterinario varchar(50) not null,
Apellidos_Veterinario varchar(50) not null,
Id_Especialidad int foreign key references Especialidad(Id_Especialidad) not null,
Id_Cargo int foreign key references Cargo(Id_Cargo) not null,
Id_User int foreign key references Users(Id_User) not null,
Id_Direccion int foreign key references direccion(Id_Direccion) not null,
Id_Telefono int foreign key references Telefono(Id_Telefono) not null
);

insert into Veterinario(Nombre_Veterinario, Apellidos_Veterinario, Id_Especialidad, Id_Cargo, Id_User, Id_Direccion, Id_Telefono)
values('Cristobal', 'Oribe', 1, 1, 1, 1, 1)
insert into Veterinario(Nombre_Veterinario, Apellidos_Veterinario, Id_Especialidad, Id_Cargo, Id_User, Id_Direccion, Id_Telefono)
values('Javier', 'Peralta', 2, 2, 2, 2, 2)
insert into Veterinario(Nombre_Veterinario, Apellidos_Veterinario, Id_Especialidad, Id_Cargo, Id_User, Id_Direccion, Id_Telefono)
values('Santiago', 'Landaverde', 3, 3, 3, 3, 3)

select * from Veterinario

select v.Nombre_Veterinario, v.Apellidos_Veterinario, e.EspecialidadV, c.CargoV, u.Name_User, d.D_direccion, t.Num_Telefono
from Veterinario as v
inner join Especialidad as e on v.Id_Especialidad = e.Id_Especialidad
inner join Cargo as c on v.Id_Cargo = c.Id_Cargo
inner join Users as u on v.Id_User = u.Id_User
inner join direccion as d on v.Id_Direccion = d.Id_Direccion
inner join Telefono as t on v.Id_Telefono = t.Id_Telefono


-------------------------------------------------------------------------------------

Create table Ingreso(
Id_Ingreso int primary key identity (1,1) not null,
Id_Mascota int foreign key references Mascota(id_Mascota) not null,
Id_Veterinario int foreign key references Veterinario(Cod_Veterinario) not null,
Fecha_hora datetime not null,
Observacion varchar(250) not null
);

insert into Users values('nestor@gmail.com',123)

SET DATEFORMAT YMD

insert into Ingreso(Id_Mascota, Id_Veterinario, Fecha_hora, Observacion)
values (1, 2, '2021/10/23 07:32:19', 'Visita de rutina')
insert into Ingreso(Id_Mascota, Id_Veterinario, Fecha_hora, Observacion)
values (2, 1, '2021/02/12 12:23:20', 'Ingreso por emergencia')
insert into Ingreso(Id_Mascota, Id_Veterinario, Fecha_hora, Observacion)
values (3, 3, '2021/11/20 03:10:21', 'Ingreso por emergencia, estado grave')

select * from Ingreso

select m.Nombre_Mascota, v.Nombre_Veterinario, v.Apellidos_Veterinario, i.Fecha_hora, i.Observacion
from Ingreso as i
inner join Mascota as m on i.Id_Mascota = m.Id_Mascota
inner join Veterinario as v on i.Id_Veterinario = v.Cod_Veterinario