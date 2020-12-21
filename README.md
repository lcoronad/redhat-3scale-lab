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

> Seleccione la opción Policies en la siguiente ruta Integration -> Policies, haga clic en el link Add Policy, seleccione la política Logging, haga clic en Logging, diligencie la siguiente información y al final haga clic en el botón "Update Policy" y después en el botón "Update Policy Chain"


```
Seleccione el check box enable_access_logs
Custom logging format: [{{time_local}}] response_api_consulta_saldo {{req.headers.X-Correlation-ID}} {{host}}:{{server_port}} {{remote_addr}}:{{remote_port}} \"{{request}}\" {{status}} {{body_bytes_sent}} ({{request_time}}) {{post_action_impact}}
```

> Seleccione la opción Methods & Metrics en la siguiente ruta Integration -> Methods & Metrics, haga clic en el link New method, diligencie la siguiente información, reemplace x con el número asignado a cada integrante y al final haga clic en el botón "Create Method"


```
Friendly name: Consulta Saldo X
System name: consulta_saldo_method_x
Description: Metodo para el endpoint de consulta de saldo
```

> Seleccione la opción Mapping Rules en la siguiente ruta Integration -> Mapping Rules, haga clic en el link Add Mapping Rule, diligencie la siguiente información y al final haga clic en el botón "Create Mapping Rule"

```
Verb: POST
Pattern: /consultaSaldo
Metrics or Method to increment: Consulta Saldo X
Deja el resto de la información por defecto
```

> Seleccione la opción Application Plans en la siguiente ruta Applications -> Application Plans, haga clic en el Create Application Plan, diligencie la siguiente información, reemplace x con el número asignado a cada integrante y al final haga clic en el botón "Create Application Plan"

```
Name: Plan Ilimitado Saldo X
System name: plan_ilimitado_saldo_x
Deje el resto de la información por defecto
```

> Haga clic en el ling Publish

> Seleccione la opción Configuration en la siguiente ruta Integration -> Configuration, haga clic en el botón "Promote v. 1 to Staging APICast", después promueva la versión al API cast de Producción haciendo clic en el botón "Promote v. 1 to Production APICast"

```
```

> Seleccione la Opción Audience en el select de la parte superior e ingrese a la ruta Accounts -> Listing, haga clic en el link "Create", diligencie los siguientes datos, reemplace x con el número asignado a cada integrante y haga clic en el botón "Create".

```
Username: user_admin_x
Email: user_admin_x@claro.com.ar
Password: (genere uno que recuerde)
Organization: Cuenta X
```

> Una vez este dentro de la cuenta, seleccione el link Applications de la parte superior, haga clic en la aplicación que se creo por defecto, posteriormente haga clic en el link Edit, haga clic en el botón "Delete"

> Seleccione el link Service Suscriptions, haga clic en el link "Unsubscribe", acepte y posteriormente haga clic en el link Subscribe del Service Consulta Saldo X, seleccione el Plan Default y haga clic en el botón "Create Subscription"

> Vuelva al link de Applications de la parte superior, haga clic en link "Create Application" 

```
```
