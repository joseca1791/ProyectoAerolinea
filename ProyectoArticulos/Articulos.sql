-------------------------------------------------------------------
                /*COMPROBANTES DE ADQUISICION*/
-------------------------------------------------------------------

create table comprobantesAdquisicion(
    idComprobante int not null,
    fechaAdquisicion date not null,
    tipoAdquisicion int not null,
    cantidadBienes int not null,
    montoTotal decimal(19,2) not null,
    estadoSolicitud int not null,
    razonRechazo varchar(2000),
    asignado int not null,
    fechaAsignacion date not null,
    nombreAdministrador varchar(15),
    nombreRegistrador varchar(15)
);

create sequence comprobantesAdquisicionSeq start with 1;

create or replace trigger comprobantesAdquisicionTrigger
before insert on comprobantesAdquisicion
for each row

BEGIN
    select comprobantesAdquisicionSeq.NEXTVAL
    into :new.idComprobante
    from dual;
END;
/

-------------------------------------------------------------------
                /*BIENES A INCORPORAR*/
-------------------------------------------------------------------

create table bienesPorIncorporar(
    idBien int not null,
    marca varchar2(30) not null,
    modelo varchar2(30),
    serial varchar2(60) not null,
    precioUnitario decimal(19,2) not null,
    idComprobanteBien int not null,
    tipoBien int
);

create sequence bienesPorIncorporarSeq start with 1;

create or replace trigger bienesPorIncorporarTrigger
before insert on bienesPorIncorporar
for each row

BEGIN
    select bienesPorIncorporarSeq.NEXTVAL
    into :new.idBien
    from dual;
END;
/

-------------------------------------------------------------------
                /*USUARIOS*/
-------------------------------------------------------------------

create table usuarios(
    idUsuario int not null,
    contrasena varchar(8) not null,
    tipoUsuario int not null,
    dependencia int not null,
    nombre varchar(20) not null,
    primerApellido varchar(20) not null,
    segundoApellido varchar(20),
    nombreUsuario varchar(15) not null
);

create sequence usuariosSeq start with 1;

create or replace trigger usuariosTrigger
before insert on usuarios
for each row

BEGIN
    select usuariosSeq.NEXTVAL
    into :new.idUsuario
    from dual;
END;
/

-------------------------------------------------------------------
                /*TIPOS DE BIEN*/
-------------------------------------------------------------------

create table tiposBien(
    idTipo int not null,
    descripcion varchar(40) not null
);


-------------------------------------------------------------------
                /*CODIFICACIONES*/
-------------------------------------------------------------------

create table codificaciones(
    idCodificacion int not null,
    loteCodificacion int not null,
    idRegistrador int not null,
    idBien int not null
);

-------------------------------------------------------------------
                /*ARTICULOS*/
-------------------------------------------------------------------

create table articulos(
    idArticulo int not null,
    marca varchar2(30) not null,
    modelo varchar2(30),
    serial varchar2(60) not null,
    precioUnitario decimal(19,2) not null,
    cantidadActual int not null,
    tipoArticulo int not null,
    registradoPor varchar2(15) not null,
    codigoBarras varchar2(14) not null,
    dependenciaActual int not null,
    responsableActual varchar(15) not null
);

create sequence articulosSeq start with 1;

create or replace trigger articulosTrigger
before insert on articulos
for each row

BEGIN
    select articulosSeq.NEXTVAL
    into :new.idArticulo
    from dual;
END;
/

-------------------------------------------------------------------
                /*DEPENDENCIAS*/
-------------------------------------------------------------------

create table dependencias(
    idDependencia int not null,
    descripcion varchar(40) not null
);

-------------------------------------------------------------------
                /*LLAVES PRIMARIAS Y FORANEAS*/
-------------------------------------------------------------------


alter table comprobantesAdquisicion add(constraint comprobantesAdquisicionPK PRIMARY KEY(idComprobante));--sirvio
alter table bienesPorIncorporar add(constraint bienesPorIncorporarPK PRIMARY KEY(idBien));--sirvio
alter table usuarios add(constraint usuariosPK PRIMARY KEY(idUsuario));--sirvio
alter table tiposBien add(constraint tiposBienPK PRIMARY KEY(idTipo));--sirvio
alter table codificaciones add(constraint codificacionesPK PRIMARY KEY(idCodificacion));--sirvio
alter table articulos add(constraint articulosPK PRIMARY KEY(idArticulo));--sirvio
alter table dependencias add(constraint dependenciasPK PRIMARY KEY(idDependencia));--sirvio

alter table comprobantesAdquisicion add(constraint comprobantesAdquisicionTipoFK FOREIGN KEY(tipoAdquisicion) REFERENCES tiposBien(idTipo));--sirvio
alter table bienesPorIncorporar add(constraint bienPorIncIdCompFK FOREIGN KEY(idComprobanteBien) REFERENCES comprobantesAdquisicion(idComprobante));--sirvio
alter table bienesPorIncorporar add(constraint bienPorIncorporarTipoBienFK FOREIGN KEY(tipoBien) REFERENCES tiposBien(idTipo));--sirvio
alter table usuarios add(constraint usuariosDependenciaFK FOREIGN KEY(dependencia) REFERENCES dependencias(idDependencia));--sirvio
alter table codificaciones add(constraint codificacionesIdBienFK FOREIGN KEY(idBien) REFERENCES bienesPorIncorporar(idBien));--sirvio
alter table articulos add(constraint articulosTipoArticuloFK FOREIGN KEY(tipoArticulo) REFERENCES tiposBien(idTipo));--sirvio
alter table articulos add(constraint articulosDependenciaActualFK FOREIGN KEY(dependenciaActual) REFERENCES dependencias(idDependencia));--sirvio
alter table codificaciones add(constraint codIdRegFK FOREIGN KEY(idRegistrador) REFERENCES usuarios(nombreUsuario));
alter table articulos add(constraint articulosRegistradoPorFK FOREIGN KEY(registradoPor) REFERENCES usuarios(nombreUsuario));
alter table comprobantesAdquisicion add(constraint compAdqNomAdmFK FOREIGN KEY(nombreAdministrador) REFERENCES usuarios(nombreUsuario));
alter table comprobantesAdquisicion add(constraint compAdqNomRegFK FOREIGN KEY(nombreRegistrador) REFERENCES usuarios(nombreUsuario));
alter table articulos add(constraint articulosResponsableActualFK FOREIGN KEY(responsableActual) REFERENCES usuarios(nombreUsuario));

-------------------------------------------------------------------
                /*VALORES INICIALES*/
-------------------------------------------------------------------