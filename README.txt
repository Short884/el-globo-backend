╔══════════════════════════════════════════════════════════════════════════╗
║                                                                            ║
║                    EL GLOBO — SISTEMA DE GESTIÓN DE CLUB                  ║
║                              Backend API REST                             ║
║                                                                            ║
║        Club Social y Deportivo "El Globo" · Rosario, Santa Fe             ║
║   Trabajo Práctico Final · Práctica Profesionalizante II · ISCA4014       ║
║                                                                            ║
╚══════════════════════════════════════════════════════════════════════════╝


  ÍNDICE
  ──────
  1.  Descripción del proyecto
  2.  Características principales
  3.  Stack tecnológico
  4.  Estructura del proyecto
  5.  Requisitos previos
  6.  Instalación paso a paso
  7.  Variables de entorno
  8.  Puesta en marcha
  9.  Uso de la API
  10. Roles y permisos
  11. Endpoints principales
  12. Tareas automáticas del sistema
  13. Scripts disponibles
  14. Decisiones de diseño
  15. Licencia y créditos


══════════════════════════════════════════════════════════════════════════
  1. DESCRIPCIÓN DEL PROYECTO
══════════════════════════════════════════════════════════════════════════

  El Globo es un club social y deportivo con sede en Rosario, Provincia de
  Santa Fe, que reúne a 1500 socios distribuidos en distintas categorías,
  actividades deportivas y zonas de cobranza. Este repositorio contiene el
  backend del sistema informático que la comisión directiva del club
  encargó para reemplazar su gestión manual de socios, cobranzas y
  actividades por una plataforma web y móvil moderna.

  La API expone todo lo necesario para que un frontend web (administración
  interna) y una aplicación móvil ("Globo", de cara al público) puedan
  operar sobre un mismo backend: registro y categorización de socios,
  facturación mensual, control de morosidad, gestión de actividades
  deportivas, alquiler de casilleros y liquidación de cobradores.

  Este proyecto fue desarrollado como Trabajo Práctico Final de la materia
  Práctica Profesionalizante II, del Instituto Superior de Computación
  Administrativa (ISCA4014), Rosario — Ministerio de Educación de la
  Provincia de Santa Fe.


══════════════════════════════════════════════════════════════════════════
  2. CARACTERÍSTICAS PRINCIPALES
══════════════════════════════════════════════════════════════════════════

  ▸ Autenticación y roles (JWT)
    Login seguro con contraseñas hasheadas (bcrypt) y control de acceso
    por rol: Administrador, Cobrador, Instructor y Socio.

  ▸ Categorización automática de socios
    Calcula solo la categoría social (Cadete / Activo / Vitalicio) según
    edad y antigüedad, y la recalcula todos los meses de forma automática.

  ▸ Gestión integral de socios (ABMC)
    Alta, baja, modificación y consulta, con listados ordenables por
    apellido, número de socio, zona de cobranza, categoría y antigüedad.

  ▸ Plan Grupo Familiar
    Matrimonios con hijos pagan una cuota única y reciben un solo recibo
    para todo el grupo, sin límite de hijos a incorporar.

  ▸ Actividades deportivas
    Alta de disciplinas con arancel, turno e instructor a cargo;
    inscripción/baja de socios; listado de asistencia por horario para
    los instructores.

  ▸ Casilleros
    Administración de los 100 casilleros disponibles, con alquiler y
    liberación vinculados a un único socio por casillero.

  ▸ Cobranza por zonas
    Zona 0 (pago en el club) y zonas 1 a 3, cada una a cargo de un
    cobrador distinto.

  ▸ Emisión mensual de cupones
    Genera automáticamente el cupón de cada socio combinando cuota
    social, actividades inscriptas y casillero, el primer día de cada
    mes.

  ▸ Control de morosidad y recargos
    Reemite con un 5% de recargo los cupones impagos del mes anterior, y
    suspende automáticamente a los socios con dos meses consecutivos sin
    pagar.

  ▸ Liquidación semanal de cobradores
    Calcula automáticamente la comisión (10% configurable) sobre lo
    recaudado y gestiona la devolución de cupones no cobrados.

  ▸ Reportes de salida
    Los tres listados exigidos por el club: socios (multi-orden),
    asistencia por actividad y horario, y ocupación de casilleros.

  ▸ Parámetros configurables
    Cuotas, recargos, comisiones y límites de edad no están fijos en el
    código: se administran desde un endpoint de configuración.

  ▸ Documentación interactiva
    Toda la API queda documentada y probable desde el navegador vía
    Swagger (OpenAPI).


══════════════════════════════════════════════════════════════════════════
  3. STACK TECNOLÓGICO
══════════════════════════════════════════════════════════════════════════

  Lenguaje ............ TypeScript
  Framework ........... NestJS 10
  ORM ................. TypeORM
  Base de datos ....... MySQL (compatible con phpMyAdmin / XAMPP / WAMP)
  Autenticación ....... JWT (passport-jwt) + bcrypt
  Validación .......... class-validator / class-transformer
  Tareas programadas .. @nestjs/schedule
  Documentación ....... Swagger / OpenAPI


══════════════════════════════════════════════════════════════════════════
  4. ESTRUCTURA DEL PROYECTO
══════════════════════════════════════════════════════════════════════════

  el-globo-backend/
  │
  ├── database-mysql/
  │   └── el_globo.sql          Script de creación e importación (phpMyAdmin)
  │
  ├── src/
  │   ├── auth/                 Login, JWT, guards de autenticación
  │   ├── users/                Cuentas de acceso (Socio/Instructor/Cobrador)
  │   ├── configuracion/        Parámetros del sistema (cuotas, recargos, %)
  │   ├── socios/               ABMC de socios, categorización, listados
  │   ├── grupos-familiares/    Plan Grupo Familiar
  │   ├── actividades/          Actividades deportivas y asistencia
  │   ├── instructores/         Gestión de instructores
  │   ├── inscripciones/        Alta/baja de socios en actividades
  │   ├── cobradores/           Gestión de cobradores por zona
  │   ├── casilleros/           Alquiler y control de casilleros
  │   ├── cupones/              Emisión mensual, recargos, morosidad
  │   ├── rendiciones/          Liquidación semanal de cobradores
  │   ├── reportes/             Los 3 listados de salida del enunciado
  │   ├── common/               Enums, guards, decoradores, utilidades
  │   ├── database/             Configuración de TypeORM y script de seed
  │   ├── app.module.ts
  │   └── main.ts
  │
  ├── .env.example               Variables de entorno de ejemplo
  ├── package.json
  └── README.txt                 Este archivo


══════════════════════════════════════════════════════════════════════════
  5. REQUISITOS PREVIOS
══════════════════════════════════════════════════════════════════════════

  Antes de instalar el proyecto, asegurate de tener:

  [ ] Node.js 20 LTS (incluye npm)         → https://nodejs.org
  [ ] Un servidor MySQL con phpMyAdmin:
        - XAMPP        → https://www.apachefriends.org
        - WampServer    → https://www.wampserver.com
        - o cualquier equivalente (MAMP, Laragon, MySQL + phpMyAdmin manual)
  [ ] Visual Studio Code (recomendado)     → https://code.visualstudio.com
  [ ] Git                                  → https://git-scm.com

  Verificá la instalación de Node con:

      node -v
      npm -v


══════════════════════════════════════════════════════════════════════════
  6. INSTALACIÓN PASO A PASO
══════════════════════════════════════════════════════════════════════════

  PASO 1 — Clonar el repositorio
  ───────────────────────────────
      git clone https://github.com/<tu-usuario>/el-globo-backend.git
      cd el-globo-backend

  PASO 2 — Instalar las dependencias
  ───────────────────────────────────
      npm install

  PASO 3 — Levantar MySQL
  ─────────────────────────
      Iniciá los servicios de tu servidor local (Apache + MySQL en XAMPP,
      o los servicios equivalentes en WampServer) hasta que el ícono
      quede en verde / "online".

  PASO 4 — Importar la base de datos
  ─────────────────────────────────────
      1. Abrí phpMyAdmin (usualmente en http://localhost/phpmyadmin).
      2. Pestaña "Importar".
      3. Seleccioná el archivo:  database-mysql/el_globo.sql
      4. Click en "Continuar".

      Esto crea la base "el_globo" con sus 12 tablas, relaciones (FK) y
      los datos iniciales: parámetros de configuración, los 3 cobradores
      de zona, los 100 casilleros y un usuario Administrador.

  PASO 5 — Configurar las variables de entorno
  ───────────────────────────────────────────────
      Copiá el archivo de ejemplo y renombralo:

          cp .env.example .env            (Mac / Linux)
          Copy-Item .env.example .env     (Windows PowerShell)

      Abrí .env y ajustá host/puerto/usuario/contraseña según tu
      servidor MySQL (ver sección 7).

  PASO 6 — Levantar el backend
  ───────────────────────────────
      npm run start:dev

      Si todo está correcto, la terminal muestra:

          El Globo API escuchando en http://localhost:3000/api
          Documentación Swagger en http://localhost:3000/api/docs


══════════════════════════════════════════════════════════════════════════
  7. VARIABLES DE ENTORNO
══════════════════════════════════════════════════════════════════════════

  Archivo: .env  (basado en .env.example)

  ┌─────────────────────────┬──────────────────────────────────────────┐
  │ Variable                │ Descripción                               │
  ├─────────────────────────┼──────────────────────────────────────────┤
  │ NODE_ENV                │ development | production                  │
  │ PORT                    │ Puerto del backend (por defecto 3000)     │
  │ DB_HOST                 │ Host de MySQL (por defecto localhost)     │
  │ DB_PORT                 │ Puerto de MySQL (3306 XAMPP / verificar   │
  │                          │ en WampServer, puede variar p. ej. 3308)  │
  │ DB_USERNAME              │ Usuario de MySQL (por defecto root)      │
  │ DB_PASSWORD              │ Contraseña de MySQL                      │
  │ DB_NAME                  │ Nombre de la base (el_globo)             │
  │ JWT_SECRET                │ Cadena secreta para firmar los tokens   │
  │ JWT_EXPIRES_IN            │ Duración del token (por defecto 8h)     │
  │ SEED_ADMIN_EMAIL          │ Correo del admin creado por el seed     │
  │ SEED_ADMIN_PASSWORD       │ Contraseña del admin creado por el seed │
  └─────────────────────────┴──────────────────────────────────────────┘

  Nota: si tu servidor MySQL corre en un puerto distinto al estándar
  (algo común en WampServer cuando hay más de un motor de base de datos
  instalado), verificalo en el panel de control de tu servidor y
  actualizá DB_PORT en consecuencia.


══════════════════════════════════════════════════════════════════════════
  8. PUESTA EN MARCHA
══════════════════════════════════════════════════════════════════════════

  Usuario administrador de prueba (creado por el script SQL):

      Correo ..... admin@elglobo.com.ar
      Contraseña . Admin123!

  Con el backend corriendo, abrí en el navegador:

      http://localhost:3000/api/docs

  Ahí vas a encontrar la documentación Swagger completa, con la
  posibilidad de autenticarte (botón "Authorize") y probar cada endpoint
  directamente desde el navegador.


══════════════════════════════════════════════════════════════════════════
  9. USO DE LA API
══════════════════════════════════════════════════════════════════════════

  Todos los endpoints están bajo el prefijo /api y, salvo los marcados
  como públicos, requieren un token JWT en el header:

      Authorization: Bearer <token>

  Flujo típico de autenticación:

      1) POST /api/auth/login
         Body: { "email": "...", "password": "..." }
         Respuesta: { "data": { "accessToken": "...", "user": {...} } }

      2) Usar accessToken como Bearer Token en el resto de las
         solicitudes.

  La API puede probarse con Swagger (/api/docs), con Thunder Client /
  Postman, o con cualquier cliente HTTP.


══════════════════════════════════════════════════════════════════════════
  10. ROLES Y PERMISOS
══════════════════════════════════════════════════════════════════════════

  ┌───────────────┬────────────────────────────────────────────────────┐
  │ Rol            │ Alcance                                            │
  ├───────────────┼────────────────────────────────────────────────────┤
  │ ADMIN          │ Acceso total: socios, actividades, cobradores,     │
  │                │ casilleros, cupones, configuración y reportes.     │
  │ COBRADOR       │ Consulta de cupones y socios de su zona, rendición │
  │                │ semanal de lo recaudado.                           │
  │ INSTRUCTOR     │ Consulta de sus actividades y asistencia de socios │
  │                │ inscriptos.                                        │
  │ SOCIO          │ Consulta y edición de sus propios datos, inscrip-  │
  │                │ ción a actividades, consulta de sus cupones.       │
  │ (sin sesión)   │ Vitrina pública de actividades del club, pensada   │
  │                │ para la app móvil y el sitio institucional.        │
  └───────────────┴────────────────────────────────────────────────────┘


══════════════════════════════════════════════════════════════════════════
  11. ENDPOINTS PRINCIPALES
══════════════════════════════════════════════════════════════════════════

  Autenticación
      POST   /api/auth/login
      GET    /api/auth/me
      PATCH  /api/auth/change-password

  Socios
      POST   /api/socios
      GET    /api/socios?orden=alfabetico|numero|zona|categoria|antiguedad
      GET    /api/socios/:id
      PATCH  /api/socios/:id
      DELETE /api/socios/:id

  Grupos familiares
      POST   /api/grupos-familiares
      GET    /api/grupos-familiares

  Actividades e inscripciones
      GET    /api/actividades                (público)
      POST   /api/actividades
      GET    /api/actividades/asistencia
      POST   /api/inscripciones
      DELETE /api/inscripciones/:id

  Casilleros
      GET    /api/casilleros?orden=alfabetico|numero
      PATCH  /api/casilleros/:id/alquilar/:socioId
      PATCH  /api/casilleros/:id/liberar

  Cupones y cobranza
      POST   /api/cupones/generar-mensual
      GET    /api/cupones?socioId=&estado=&periodo=
      PATCH  /api/cupones/:id/pagar

  Rendiciones
      POST   /api/rendiciones
      GET    /api/rendiciones?cobradorId=

  Reportes
      GET    /api/reportes/socios
      GET    /api/reportes/asistencia-actividades
      GET    /api/reportes/casilleros

  Configuración
      GET    /api/configuracion
      PATCH  /api/configuracion

  La lista completa y detallada de parámetros está siempre disponible y
  actualizada en /api/docs (Swagger).


══════════════════════════════════════════════════════════════════════════
  12. TAREAS AUTOMÁTICAS DEL SISTEMA
══════════════════════════════════════════════════════════════════════════

  El día 1 de cada mes, a las 00:00, el sistema ejecuta automáticamente:

      1. Recalcula la categoría social de todos los socios activos.
      2. Aplica el control de morosidad del período anterior (suspende a
         quienes acumulan dos meses consecutivos impagos).
      3. Emite los cupones nuevos del mes.
      4. Reemite, con un 5% de recargo, los cupones impagos del mes
         anterior (salvo socios ya suspendidos).

  Este proceso también puede dispararse manualmente en cualquier momento
  desde POST /api/cupones/generar-mensual (rol ADMIN), útil para pruebas.


══════════════════════════════════════════════════════════════════════════
  13. SCRIPTS DISPONIBLES
══════════════════════════════════════════════════════════════════════════

  ┌───────────────────────────────┬──────────────────────────────────────┐
  │ Comando                        │ Descripción                          │
  ├───────────────────────────────┼──────────────────────────────────────┤
  │ npm run start:dev              │ Backend en modo desarrollo (watch)   │
  │ npm run start                  │ Backend, corrida única               │
  │ npm run build                  │ Compila TypeScript a dist/           │
  │ npm run start:prod             │ Corre la versión compilada           │
  │ npm run seed                   │ Carga datos iniciales (alternativa   │
  │                                 │ al script SQL de phpMyAdmin)         │
  │ npm run migration:generate     │ Genera una migración de TypeORM      │
  │ npm run migration:run          │ Aplica migraciones pendientes        │
  │ npm run lint                   │ Corre ESLint                         │
  └───────────────────────────────┴──────────────────────────────────────┘


══════════════════════════════════════════════════════════════════════════
  14. DECISIONES DE DISEÑO
══════════════════════════════════════════════════════════════════════════

  ▸ MySQL en vez de otro motor: elegido para poder administrar la base
    con phpMyAdmin, herramienta ampliamente disponible en entornos de
    hosting compartido y de desarrollo local (XAMPP/WAMP).

  ▸ Parámetros configurables: los montos de cuotas, recargos y comisión
    no están fijos en el código fuente; viven en una tabla editable por
    el Administrador, para que el club pueda ajustarlos sin necesitar un
    nuevo despliegue.

  ▸ Baja lógica de socios: se preserva el historial de cupones y
    actividad de cada socio dado de baja en lugar de eliminarlo
    físicamente de la base.

  ▸ synchronize activo solo en desarrollo: en producción se recomienda
    usar migraciones (npm run migration:generate / migration:run) para
    evitar pérdidas de datos ante cambios de esquema.


══════════════════════════════════════════════════════════════════════════
  15. LICENCIA Y CRÉDITOS
══════════════════════════════════════════════════════════════════════════

  Proyecto académico desarrollado en el marco de la Práctica
  Profesionalizante II del Instituto Superior de Computación
  Administrativa (ISCA4014) — Rosario, Santa Fe, Argentina.

  Uso educativo. Consultá con tu equipo docente antes de cualquier
  publicación o distribución con fines distintos al académico.

  ──────────────────────────────────────────────────────────────────────
  Club Social y Deportivo "El Globo" — Pasco 2856, Rosario, Santa Fe.
  ──────────────────────────────────────────────────────────────────────
