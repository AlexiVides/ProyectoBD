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


Create table direccion(
Id_Direccion int primary key identity (1,1) not null,
D_direccion varchar(50) not null,
Cod_Postal int not null,
Id_Mucipio int foreign key references municipio(id_Municipio) not null
);


Create table Telefono (
Id_Telefono int primary key identity (1,1) not null,
Codigo_Area int not null,
Num_Telefono int unique not null
);


Create table Dueño (
Id_dueno int primary key identity (1,1) not null,
Dui int  not null,
Nombre_Dueño varchar(50) not null,
Apellidos_Dueño varchar(50) not null,
Id_Direccion int foreign key references direccion(Id_Direccion) not null,
Id_Telefono int foreign key references Telefono(Id_Telefono) not null
);


--------------------------------------------------------------------------------------

Create table Tipo_Mascota(
Id_tipoMascota int primary key identity (1,1) not null,
TipoMascota varchar(50) not null
);


Create table Raza_Mascota(
Id_razaMascota int primary key identity (1,1) not null,
RazaMascota varchar (50) not null
);


Create table Descrip_Mascota(
Id_Descrip int primary key identity (1,1) not null,
Tamaño_m float not null,
Edad_m int not null,
Color_m varchar(50) not null,
Comida_fav varchar(50) not null,
Id_tipoMascota int foreign key references Tipo_Mascota(Id_tipoMascota) not null,
Id_razaMascota int foreign key references Raza_Mascota(Id_razaMascota) not null
);


Create table Mascota(
Id_Mascota int primary key identity (1,1) not null,
Nombre_Mascota varchar(50) not null,
F_Nacimiento date not null,
Observacion varchar(50) not null,
Id_Descrip int foreign key references Descrip_Mascota(Id_Descrip) not null,
Id_Dueño int foreign key references Dueño(Id_dueno) not null,
);

------------------------------------------------------------------------------------------------

create table Users(
Id_User int primary key identity (1,1) not null,
Name_User varchar(50) unique not null,
Pass varchar(25) not null
);


create table Cargo(
Id_Cargo int primary key identity (1,1) not null,
CargoV varchar(100) not null
);


create table Especialidad(
Id_Especialidad int primary key identity (1,1) not null,
EspecialidadV varchar(100) not null
);


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

-------------------------------------------------------------------------------------

Create table Ingreso(
Id_Ingreso int primary key identity (1,1) not null,
Id_Mascota int foreign key references Mascota(id_Mascota) not null,
Id_Veterinario int foreign key references Veterinario(Cod_Veterinario) not null,
Fecha_hora datetime not null,
Observacion varchar(250) not null
);

insert into Users values('nestor@gmail.com',123)
