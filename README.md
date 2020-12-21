# redhat-3scale-lab

Laboratorio para crear un API en 3scale

## Despliegue la aplicación


## Configuración de API en 3scale

> Por medio de los siguientes pasos se creara un API en 3scale 2.9

### Crear Backend

> Ingresar a la URL [Admin Portal 3scale](https://3scale-admin.apps.osepext01.claro.amx/), las credenciales las indicará el instructor

> Seleccionar el tab Backends de la sección de APIs del Dashboard de 3scale

> Hacer clic en el link NEW BACKEND

> Crear el backend con la siguiente información, reemplace x con el número asignado a cada integrante y haga clic en el botón "Create Backend"

```
Name: Consulta Saldo BK X
System name: consulta_saldo_bk_x
Description: Backend que implementa la consulta de saldo.
Private Base URL: http://consulta-saldo...
```

> Seleccionar el tab Products de la sección de APIs del Dashboard de 3scale

> Hacer clic en el link NEW PRODUCT

> Crear el product con la siguiente información, reemplace x con el número asignado a cada integrante y haga clic en el botón "Create Product"

```
Seleccione el check box de Define manually
Name: Consulta Saldo API X
System name: consulta_saldo_api_x
Description: API que expone la consulta de saldo
```

> Seleccione la opción Settings en la siguiente ruta Integration -> Settings y diligencie la siguiente información

```
Deployment: APIcast 3scale managed
Authentication: OpenID Connect
OpenID Connect Issuer Type: Red Hat Single Sign-On
OpenID Connect Issuer: http://3scale-sso-sync:65dc647d-8afc-40c1-8a4d-8455d86c6139@claro-sso-idp-desa.apps.osenext01.claro.amx/auth/realms/test/protocol/openid-connect/token
OICD Authorization Flow: Service Accounts Flow
El resto de la parametrización dejarla por defecto.
```

> Seleccione la opción Backends en la siguiente ruta Integration -> Backends, haga clic en el link Add Backend, diligencie la siguiente información y al final haga clic en el botón "Add to Product"

```
Backend: Consulta Saldo BK X
Path: /
```

>

```
```

```
```
