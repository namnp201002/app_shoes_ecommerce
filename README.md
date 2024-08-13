# App Shoe Ecommerce
This app follow clean architecture proposed By Uncle Bob I used BloC as state management to improve widget rebuilding performance.

## Screenshots

| Error Screen                                                                                                   | Login Screen                                                                                     | Sign Up Screen                                                                                      | Profile Screen                                                                                      | Home Screen |
|----------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------|-----|
| ![Screenshot_20240806_154114](https://github.com/user-attachments/assets/e297fb6f-4142-4d4d-9c07-8a81db70444f) | ![login_screen](https://github.com/user-attachments/assets/39dcea04-e69c-4c73-b824-d8689c163a85) | ![register_screen](https://github.com/user-attachments/assets/044fd34e-fa0f-45ae-947b-bf3a0017a606) | ![profile_logged](https://github.com/user-attachments/assets/7beb253a-4777-4747-990e-872bafdb91bb)  | ![home_page](https://github.com/user-attachments/assets/4abf2e23-734d-4b05-a89d-e078c48a7147) |

## App Features
* Authentication (Login/Register)
* Products can be accessed in-app
* Add, Update, Delete product to Cart
* Theme: Dark/Light mode 
* Language: Supported English and Vietnamese
* Updating...

> [!NOTE]
> Account test app: Email `namnp201002@gmail.com` & Password: `1234567890`

## Directory Structure
```
📦 app-shoes-ecommerce
├─ assets
└─ lib
   ├─ core
   │  ├─ common
   │  ├─ common_widget
   │  ├─ error
   │  ├─ network
   │  ├─ secrets
   │  ├─ theme
   │  ├─ usecase
   │  └─ utilities
   ├─ data
   │  ├─ cart
   │  │  ├─ datasources
   │  │  ├─ models
   │  │  └─ repository
   │  ├─ login
   │  │  ├─ datasources
   │  │  ├─ model
   │  │  └─ repostiory
   │  └─ product
   │     ├─ datasources
   │     ├─ models
   │     └─ repository
   ├─ domain
   │  ├─ cart
   │  │  ├─ entities
   │  │  ├─ repository
   │  │  └─ usecases
   │  ├─ login
   │  │  ├─ entities
   │  │  ├─ repository
   │  │  └─ usecases
   │  └─ product
   │     ├─ entites
   │     ├─ repository
   │     └─ usecases
   ├─ l10
   └─ presentation
      ├─ cart
      │  ├─ bloc
      │  ├─ pages
      │  └─ widgets
      ├─ home
      │  ├─ bloc
      │  ├─ pages
      │  └─ widgets
      ├─ language
      │  ├─ bloc
      │  └─ page
      ├─ login
      │  ├─ bloc
      │  ├─ pages
      │  └─ widgets
      ├─ product
      │  ├─ bloc
      │  │  ├─ product_detail_bloc
      │  │  └─ product_infinite_bloc
      │  ├─ pages
      │  └─ widgets
      └─ profile
         └─ pages
```

## .ENV
- BASE_URL: `https://api.chec.io/v1/`
- API_KEY: `.....`
- FIREBASE: `.....`
