# App Shoe Ecommerce
This app follow clean architecture proposed By Uncle Bob I used BloC as state management to improve widget rebuilding performance.

## Screenshots

| Error Screen                                                                                                   | Login Screen                                                                                     | Sign Up Screen                                                                                      | Profile Screen                                                                                      | Home Screen |
|:----------------------------------------------------------------------------------------------------------------:|:--------------------------------------------------------------------------------------------------:|:-----------------------------------------------------------------------------------------------------:|:-----------------------------------------------------------------------------------------------------:|:-------------:|
| ![Screenshot_20240806_154114](https://github.com/user-attachments/assets/e297fb6f-4142-4d4d-9c07-8a81db70444f) | ![login_screen](https://github.com/user-attachments/assets/39dcea04-e69c-4c73-b824-d8689c163a85) | ![register_screen](https://github.com/user-attachments/assets/044fd34e-fa0f-45ae-947b-bf3a0017a606) | ![profile_logged](https://github.com/user-attachments/assets/7beb253a-4777-4747-990e-872bafdb91bb)  | ![home_page](https://github.com/user-attachments/assets/4abf2e23-734d-4b05-a89d-e078c48a7147) |

| Infinite Loading                                                                                     | Product Detail Screen(1)                                                                             | Product Detail Screen(2)                                                                             | Add To Cart                                                                                             | Loading Add To Cart                                                                                     |
|------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------|
| <img src="https://github.com/user-attachments/assets/4b172b11-9154-456e-8356-68d7faf0d68b" alt="infinite_loading" width="200"> | <img src="https://github.com/user-attachments/assets/3819f46a-f166-481b-88ab-75ef82a55293" alt="product_detail_1" width="200"> | <img src="https://github.com/user-attachments/assets/cb1d1673-3b3f-4dbb-9925-e43877d63094" alt="product_detail_2" width="200"> | <img src="https://github.com/user-attachments/assets/de394c82-46c7-495f-95c9-5f57ffea834a" alt="add_product_to_cart" width="200"> | <img src="https://github.com/user-attachments/assets/507dc8c5-2ad3-4030-bb90-9c3438c5d3d7" alt="loading_add_to_cart" width="200"> |


| Cart Screen | Edit Product Cart | Delete Product Cart | Edit Profile Screen | Language Screen |
|:----------------------------------------------------------------------------------------------------------------:|:--------------------------------------------------------------------------------------------------:|:-----------------------------------------------------------------------------------------------------:|:-----------------------------------------------------------------------------------------------------:|:-------------:|
| ![cart_page](https://github.com/user-attachments/assets/ad180b68-e68d-419e-9c98-f5d4170debab) | ![edit_product_cart](https://github.com/user-attachments/assets/853c401c-896b-4cf2-a491-874f972f3469) | ![delete_product_cart](https://github.com/user-attachments/assets/fd51b1d3-4d1c-4872-9ea6-95c114b02195) | ![edit_profile](https://github.com/user-attachments/assets/6a71bd1d-007d-4c93-82fd-8834b0cb096f) | ![language_select](https://github.com/user-attachments/assets/c5b356b8-373c-4f29-bafe-2d621080b119) |


| Profile (Vi Lang)  | Dark Theme |
| :--: | :--: |
| <img src="https://github.com/user-attachments/assets/48f90e3b-f5a8-4648-bc82-1dc3c5a3028f" alt="infinite_loading" width="200">  | <img src="https://github.com/user-attachments/assets/ea92ad3e-0050-4949-860d-70431a1ad7a8" alt="infinite_loading" width="200"> |


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
