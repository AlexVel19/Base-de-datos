/*==============================================================*/
/* DBMS name:      PostgreSQL 8                                 */
/* Created on:     18/11/2021 16:39:52                          */
/*==============================================================*/


/*==============================================================*/
/* Table: CLIENTE                                               */
/*==============================================================*/
create table CLIENTE (
   CLIENTE_ID           INT4                 not null,
   LUGAR_ID             INT4                 not null,
   CLIENTE_NOMBRE       VARCHAR(10)          not null,
   CLIENTE_APELLIDO     VARCHAR(10)          not null,
   CLIENTE_CI           VARCHAR(10)          not null,
   CLIENTE_TELEFONO     VARCHAR(10)          not null,
   CLIENTE_CORREO       VARCHAR(30)          not null,
   constraint PK_CLIENTE primary key (CLIENTE_ID)
);

/*==============================================================*/
/* Index: CLIENTE_PK                                            */
/*==============================================================*/
create unique index CLIENTE_PK on CLIENTE (
CLIENTE_ID
);

/*==============================================================*/
/* Index: CLIENTE_LUGAR_FK                                      */
/*==============================================================*/
create  index CLIENTE_LUGAR_FK on CLIENTE (
LUGAR_ID
);

/*==============================================================*/
/* Table: LUGAR                                                 */
/*==============================================================*/
create table LUGAR (
   LUGAR_ID             INT4                 not null,
   LUGAR_NOMBRE         VARCHAR(15)          not null,
   constraint PK_LUGAR primary key (LUGAR_ID)
);

/*==============================================================*/
/* Index: LUGAR_PK                                              */
/*==============================================================*/
create unique index LUGAR_PK on LUGAR (
LUGAR_ID
);

/*==============================================================*/
/* Table: MANTENIMIENTO                                         */
/*==============================================================*/
create table MANTENIMIENTO (
   MANTENIMIENTO_ID     INT4                 not null,
   TECNICO_ID           INT4                 not null,
   MANTENMIENTO_FECHA_R DATE                 not null,
   MANTENIMIENTO_FECHA_E DATE                 not null,
   MANTENIMIENTO_GARANTIA_FECHA DATE                 not null,
   MANTENIMIENTO_DETALLE VARCHAR(50)          not null,
   MANTENIMIENTO_COSTO  NUMERIC                not null,
   MANTENIMIENTO_COMPLETADO BOOL                 not null,
   constraint PK_MANTENIMIENTO primary key (MANTENIMIENTO_ID)
);

/*==============================================================*/
/* Index: MANTENIMIENTO_PK                                      */
/*==============================================================*/
create unique index MANTENIMIENTO_PK on MANTENIMIENTO (
MANTENIMIENTO_ID
);

/*==============================================================*/
/* Index: TECNICO_MANTENIMIEINTO_FK                             */
/*==============================================================*/
create  index TECNICO_MANTENIMIEINTO_FK on MANTENIMIENTO (
TECNICO_ID
);

/*==============================================================*/
/* Table: PRODUCTO                                              */
/*==============================================================*/
create table PRODUCTO (
   PRODUCTO_ID          INT4                 not null,
   PROVEEDOR_ID         INT4                 not null,
   PRODUCTO_TIPO_ID     INT4                 not null,
   PRODUCTO_NOMBRE      VARCHAR(100)         not null,
   PRODUCTO_PRECIO      NUMERIC                not null,
   PRODUCTO_STOCK       NUMERIC(4)           not null,
   PRODUCTO_FECHA_E     DATE                 not null,
   constraint PK_PRODUCTO primary key (PRODUCTO_ID)
);

/*==============================================================*/
/* Index: PRODUCTO_PK                                           */
/*==============================================================*/
create unique index PRODUCTO_PK on PRODUCTO (
PRODUCTO_ID
);

/*==============================================================*/
/* Index: PROVEEDOR_PRODUCTO_FK                                 */
/*==============================================================*/
create  index PROVEEDOR_PRODUCTO_FK on PRODUCTO (
PROVEEDOR_ID
);

/*==============================================================*/
/* Index: PRODUCTO_TIPO_FK                                      */
/*==============================================================*/
create  index PRODUCTO_TIPO_FK on PRODUCTO (
PRODUCTO_TIPO_ID
);

/*==============================================================*/
/* Table: PRODUCTO_MANTENIMIENTO                                */
/*==============================================================*/
create table PRODUCTO_MANTENIMIENTO (
   MANTENIMIENTO_ID     INT4                 not null,
   PRODUCTO_ID          INT4                 not null,
   constraint PK_PRODUCTO_MANTENIMIENTO primary key (MANTENIMIENTO_ID, PRODUCTO_ID)
);

/*==============================================================*/
/* Index: PRODUCT_MANTENIMIENTO_PK                              */
/*==============================================================*/
create unique index PRODUCT_MANTENIMIENTO_PK on PRODUCTO_MANTENIMIENTO (
MANTENIMIENTO_ID,
PRODUCTO_ID
);

/*==============================================================*/
/* Index: PRODUCTO_MANTENIMIENTO2_FK                            */
/*==============================================================*/
create  index PRODUCTO_MANTENIMIENTO2_FK on PRODUCTO_MANTENIMIENTO (
PRODUCTO_ID
);

/*==============================================================*/
/* Index: PRODUCTO_MANTENIMIENTO_FK                             */
/*==============================================================*/
create  index PRODUCTO_MANTENIMIENTO_FK on PRODUCTO_MANTENIMIENTO (
MANTENIMIENTO_ID
);

/*==============================================================*/
/* Table: PRODUCTO_TIPO                                         */
/*==============================================================*/
create table PRODUCTO_TIPO (
   PRODUCTO_TIPO_ID     INT4                 not null,
   PRODUCTO_TIPO_NOMBRE VARCHAR(15)          not null,
   constraint PK_PRODUCTO_TIPO primary key (PRODUCTO_TIPO_ID)
);

/*==============================================================*/
/* Index: PRODUCTO_TIPO_PK                                      */
/*==============================================================*/
create unique index PRODUCTO_TIPO_PK on PRODUCTO_TIPO (
PRODUCTO_TIPO_ID
);

/*==============================================================*/
/* Table: PRODUCTO_VENTAS                                       */
/*==============================================================*/
create table PRODUCTO_VENTAS (
   VENTAS_ID            INT4                 not null,
   PRODUCTO_ID          INT4                 not null,
   constraint PK_PRODUCTO_VENTAS primary key (VENTAS_ID, PRODUCTO_ID)
);

/*==============================================================*/
/* Index: PRODUCTO_VENTAS_PK                                    */
/*==============================================================*/
create unique index PRODUCTO_VENTAS_PK on PRODUCTO_VENTAS (
VENTAS_ID,
PRODUCTO_ID
);

/*==============================================================*/
/* Index: PRODUCTO_VENTAS2_FK                                   */
/*==============================================================*/
create  index PRODUCTO_VENTAS2_FK on PRODUCTO_VENTAS (
PRODUCTO_ID
);

/*==============================================================*/
/* Index: PRODUCTO_VENTAS_FK                                    */
/*==============================================================*/
create  index PRODUCTO_VENTAS_FK on PRODUCTO_VENTAS (
VENTAS_ID
);

/*==============================================================*/
/* Table: PROVEEDOR                                             */
/*==============================================================*/
create table PROVEEDOR (
   PROVEEDOR_ID         INT4                 not null,
   LUGAR_ID             INT4                 not null,
   PROVEEDOR_NOMBRE     VARCHAR(15)          not null,
   PROVEEDOR_CORREO     VARCHAR(20)          not null,
   PROVEEDOR_SITIO_WEB  VARCHAR(15)          not null,
   PROVEEDOR_TELEFONO   VARCHAR(10)          not null,
   PROVEEDOR_RUC        VARCHAR(10)          not null,
   constraint PK_PROVEEDOR primary key (PROVEEDOR_ID)
);

/*==============================================================*/
/* Index: PROVEEDOR_PK                                          */
/*==============================================================*/
create unique index PROVEEDOR_PK on PROVEEDOR (
PROVEEDOR_ID
);

/*==============================================================*/
/* Index: PROVEEDOR_LUGAR_FK                                    */
/*==============================================================*/
create  index PROVEEDOR_LUGAR_FK on PROVEEDOR (
LUGAR_ID
);

/*==============================================================*/
/* Table: TECNICO                                               */
/*==============================================================*/
create table TECNICO (
   TECNICO_ID           INT4                 not null,
   TECNICO_TIPO_ID      INT4                 not null,
   TECNICO_NOMBRE       VARCHAR(10)          not null,
   TECNICO_APELLIDO     VARCHAR(10)          not null,
   TECNICO_CI           VARCHAR(10)          not null,
   TECNICO_FECHA_NACIMIENTO DATE                 not null,
   TECNICO_GENERO       VARCHAR(10)          not null,
   constraint PK_TECNICO primary key (TECNICO_ID)
);

/*==============================================================*/
/* Index: TECNICO_PK                                            */
/*==============================================================*/
create unique index TECNICO_PK on TECNICO (
TECNICO_ID
);

/*==============================================================*/
/* Index: TECNICO_TIPO_FK                                       */
/*==============================================================*/
create  index TECNICO_TIPO_FK on TECNICO (
TECNICO_TIPO_ID
);

/*==============================================================*/
/* Table: TECNICO_TIPO                                          */
/*==============================================================*/
create table TECNICO_TIPO (
   TECNICO_TIPO_ID      INT4                 not null,
   TECNICO_TIPO_NOMBRE  VARCHAR(30)          not null,
   constraint PK_TECNICO_TIPO primary key (TECNICO_TIPO_ID)
);

/*==============================================================*/
/* Index: TECNICO_TIPO_PK                                       */
/*==============================================================*/
create unique index TECNICO_TIPO_PK on TECNICO_TIPO (
TECNICO_TIPO_ID
);

/*==============================================================*/
/* Table: VENTAS                                                */
/*==============================================================*/
create table VENTAS (
   VENTAS_ID            INT4                 not null,
   CLIENTE_ID           INT4                 not null,
   VENTAS_FECHA         DATE                 not null,
   VENTAS_CANTIDAD      NUMERIC              not null,
   VENTAS_SUBTOTAL      NUMERIC                not null,
   VENTAS_IVA           NUMERIC                not null,
   VENTAS_TOTAL         NUMERIC                not null,
   VENTAS_FORMA_PAGO    VARCHAR(15)          not null,
   constraint PK_VENTAS primary key (VENTAS_ID)
);

/*==============================================================*/
/* Index: VENTAS_PK                                             */
/*==============================================================*/
create unique index VENTAS_PK on VENTAS (
VENTAS_ID
);

/*==============================================================*/
/* Index: CLIENTE_VENTAS_FK                                     */
/*==============================================================*/
create  index CLIENTE_VENTAS_FK on VENTAS (
CLIENTE_ID
);

alter table CLIENTE
   add constraint FK_CLIENTE_LUGAR foreign key (LUGAR_ID)
      references LUGAR (LUGAR_ID)
      on delete restrict on update restrict;

alter table MANTENIMIENTO
   add constraint FK_MANTENIM_TECNICO foreign key (TECNICO_ID)
      references TECNICO (TECNICO_ID)
      on delete restrict on update restrict;

alter table PRODUCTO
   add constraint FK_PRODUCTO_TIPO foreign key (PRODUCTO_TIPO_ID)
      references PRODUCTO_TIPO (PRODUCTO_TIPO_ID)
      on delete restrict on update restrict;

alter table PRODUCTO
   add constraint FK_PRODUCTO_PROVEEDOR foreign key (PROVEEDOR_ID)
      references PROVEEDOR (PROVEEDOR_ID)
      on delete restrict on update restrict;

alter table PRODUCTO_MANTENIMIENTO
   add constraint FK_PRODUCTO_MANTENIM foreign key (MANTENIMIENTO_ID)
      references MANTENIMIENTO (MANTENIMIENTO_ID)
      on delete restrict on update restrict;

alter table PRODUCTO_MANTENIMIENTO
   add constraint FK_PRODUCTO_MANTENIM2 foreign key (PRODUCTO_ID)
      references PRODUCTO (PRODUCTO_ID)
      on delete restrict on update restrict;

alter table PRODUCTO_VENTAS
   add constraint FK_PRODUCTO_VENTAS foreign key (VENTAS_ID)
      references VENTAS (VENTAS_ID)
      on delete restrict on update restrict;

alter table PRODUCTO_VENTAS
   add constraint FK_PRODUCTO_VENTAS2 foreign key (PRODUCTO_ID)
      references PRODUCTO (PRODUCTO_ID)
      on delete restrict on update restrict;

alter table PROVEEDOR
   add constraint FK_PROVEEDOR_LUGAR foreign key (LUGAR_ID)
      references LUGAR (LUGAR_ID)
      on delete restrict on update restrict;

alter table TECNICO
   add constraint FK_TECNICO_TIPO foreign key (TECNICO_TIPO_ID)
      references TECNICO_TIPO (TECNICO_TIPO_ID)
      on delete restrict on update restrict;

alter table VENTAS
   add constraint FK_VENTAS_CLIENTE foreign key (CLIENTE_ID)
      references CLIENTE (CLIENTE_ID)
      on delete restrict on update restrict;

