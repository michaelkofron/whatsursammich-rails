# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes): 

-> User has_many :sams

- [x] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User)

-> Sams belong_to Users

- [x] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients)

-> User has many Spoints through Sams
-> User has many Rpoints through Reviews

- [x] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients)
- [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity)

-> User.spoints.values (based on user review rating)
-> User.rpoints.values
-> sam points are also available to Sammich itself

- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)

-> all user-submitted models have proper validations which are shown in views if errors

- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)

-> scope :popular and scope :newest on Sam.rb model

- [x] Include signup (how e.g. Devise)
- [x] Include login (how e.g. Devise)
- [x] Include logout (how e.g. Devise)
- [x] Include third party signup/login (how e.g. Devise/OmniAuth)

-> sign up and login available through site or through Facebook

- [x] Include nested resource show or index (URL e.g. users/2/recipes)

-> reviews are clickable leading to a nested show path for that specific review

- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)

-> reviews/new is nested inside sammiches path

- [x] Include form display of validation errors (form URL e.g. /recipes/new)

-> errors displayed underneath forms

Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate
