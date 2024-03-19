
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 03/18/2024 16:53:24
-- Generated from EDMX file: C:\0 - Enivel7\3 - GIT\BoxcoinWPFUItest\BoxcoinWPFUItest\Model\Modelo.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [Boxcoin];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_permisos_menu]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[permisos] DROP CONSTRAINT [FK_permisos_menu];
GO
IF OBJECT_ID(N'[dbo].[FK_ppr_PERMISOS]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[permisos_por_rol] DROP CONSTRAINT [FK_ppr_PERMISOS];
GO
IF OBJECT_ID(N'[dbo].[FK_ppr_ROLES]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[permisos_por_rol] DROP CONSTRAINT [FK_ppr_ROLES];
GO
IF OBJECT_ID(N'[dbo].[fk_rolesPorUsuario_ROL]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[roles_por_usuario] DROP CONSTRAINT [fk_rolesPorUsuario_ROL];
GO
IF OBJECT_ID(N'[dbo].[fk_rolesPorUsuario_USUARIO]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[roles_por_usuario] DROP CONSTRAINT [fk_rolesPorUsuario_USUARIO];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[EntidadSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[EntidadSet];
GO
IF OBJECT_ID(N'[dbo].[menu_opciones]', 'U') IS NOT NULL
    DROP TABLE [dbo].[menu_opciones];
GO
IF OBJECT_ID(N'[dbo].[pepito]', 'U') IS NOT NULL
    DROP TABLE [dbo].[pepito];
GO
IF OBJECT_ID(N'[dbo].[permisos]', 'U') IS NOT NULL
    DROP TABLE [dbo].[permisos];
GO
IF OBJECT_ID(N'[dbo].[permisos_por_rol]', 'U') IS NOT NULL
    DROP TABLE [dbo].[permisos_por_rol];
GO
IF OBJECT_ID(N'[dbo].[roles]', 'U') IS NOT NULL
    DROP TABLE [dbo].[roles];
GO
IF OBJECT_ID(N'[dbo].[roles_por_usuario]', 'U') IS NOT NULL
    DROP TABLE [dbo].[roles_por_usuario];
GO
IF OBJECT_ID(N'[dbo].[usuarios]', 'U') IS NOT NULL
    DROP TABLE [dbo].[usuarios];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'EntidadSet'
CREATE TABLE [dbo].[EntidadSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [nombre] nvarchar(max)  NOT NULL,
    [calle] nvarchar(max)  NULL,
    [numero_calle] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'menu_opciones'
CREATE TABLE [dbo].[menu_opciones] (
    [id] int  NOT NULL,
    [menu] nvarchar(50)  NULL
);
GO

-- Creating table 'pepito'
CREATE TABLE [dbo].[pepito] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [nombre] nvarchar(max)  NOT NULL,
    [apellido] nvarchar(max)  NOT NULL,
    [id_entidad] int  NOT NULL
);
GO

-- Creating table 'permisos'
CREATE TABLE [dbo].[permisos] (
    [id] int  NOT NULL,
    [permiso] nvarchar(50)  NULL,
    [id_menu] int  NULL
);
GO

-- Creating table 'permisos_por_rol'
CREATE TABLE [dbo].[permisos_por_rol] (
    [id] int  NOT NULL,
    [id_permiso] int  NOT NULL,
    [id_rol] int  NOT NULL
);
GO

-- Creating table 'roles'
CREATE TABLE [dbo].[roles] (
    [id] int  NOT NULL,
    [rol] nvarchar(50)  NULL
);
GO

-- Creating table 'roles_por_usuario'
CREATE TABLE [dbo].[roles_por_usuario] (
    [id] int  NOT NULL,
    [id_usuario] int  NOT NULL,
    [id_rol] int  NOT NULL
);
GO

-- Creating table 'usuarios'
CREATE TABLE [dbo].[usuarios] (
    [id] int IDENTITY(1,1) NOT NULL,
    [nombre] nvarchar(10)  NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'EntidadSet'
ALTER TABLE [dbo].[EntidadSet]
ADD CONSTRAINT [PK_EntidadSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [id] in table 'menu_opciones'
ALTER TABLE [dbo].[menu_opciones]
ADD CONSTRAINT [PK_menu_opciones]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [Id] in table 'pepito'
ALTER TABLE [dbo].[pepito]
ADD CONSTRAINT [PK_pepito]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [id] in table 'permisos'
ALTER TABLE [dbo].[permisos]
ADD CONSTRAINT [PK_permisos]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'permisos_por_rol'
ALTER TABLE [dbo].[permisos_por_rol]
ADD CONSTRAINT [PK_permisos_por_rol]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'roles'
ALTER TABLE [dbo].[roles]
ADD CONSTRAINT [PK_roles]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'roles_por_usuario'
ALTER TABLE [dbo].[roles_por_usuario]
ADD CONSTRAINT [PK_roles_por_usuario]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'usuarios'
ALTER TABLE [dbo].[usuarios]
ADD CONSTRAINT [PK_usuarios]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [id_menu] in table 'permisos'
ALTER TABLE [dbo].[permisos]
ADD CONSTRAINT [FK_permisos_menu]
    FOREIGN KEY ([id_menu])
    REFERENCES [dbo].[menu_opciones]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_permisos_menu'
CREATE INDEX [IX_FK_permisos_menu]
ON [dbo].[permisos]
    ([id_menu]);
GO

-- Creating foreign key on [id_permiso] in table 'permisos_por_rol'
ALTER TABLE [dbo].[permisos_por_rol]
ADD CONSTRAINT [FK_ppr_PERMISOS]
    FOREIGN KEY ([id_permiso])
    REFERENCES [dbo].[permisos]
        ([id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ppr_PERMISOS'
CREATE INDEX [IX_FK_ppr_PERMISOS]
ON [dbo].[permisos_por_rol]
    ([id_permiso]);
GO

-- Creating foreign key on [id_rol] in table 'permisos_por_rol'
ALTER TABLE [dbo].[permisos_por_rol]
ADD CONSTRAINT [FK_ppr_ROLES]
    FOREIGN KEY ([id_rol])
    REFERENCES [dbo].[roles]
        ([id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ppr_ROLES'
CREATE INDEX [IX_FK_ppr_ROLES]
ON [dbo].[permisos_por_rol]
    ([id_rol]);
GO

-- Creating foreign key on [id_rol] in table 'roles_por_usuario'
ALTER TABLE [dbo].[roles_por_usuario]
ADD CONSTRAINT [fk_rolesPorUsuario_ROL]
    FOREIGN KEY ([id_rol])
    REFERENCES [dbo].[roles]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'fk_rolesPorUsuario_ROL'
CREATE INDEX [IX_fk_rolesPorUsuario_ROL]
ON [dbo].[roles_por_usuario]
    ([id_rol]);
GO

-- Creating foreign key on [id_usuario] in table 'roles_por_usuario'
ALTER TABLE [dbo].[roles_por_usuario]
ADD CONSTRAINT [fk_rolesPorUsuario_USUARIO]
    FOREIGN KEY ([id_usuario])
    REFERENCES [dbo].[usuarios]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'fk_rolesPorUsuario_USUARIO'
CREATE INDEX [IX_fk_rolesPorUsuario_USUARIO]
ON [dbo].[roles_por_usuario]
    ([id_usuario]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------