import 'package:news_app/model/category_model.dart';

List<CategoryModel> getCategories() {
  List<CategoryModel> category = new List<CategoryModel>();
  CategoryModel categoryModel = new CategoryModel();

  //1
  categoryModel.categoryName = "Business";
  categoryModel.imageURL =
      "https://images.unsplash.com/photo-1486406146926-c627a92ad1ab?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60";

  category.add(categoryModel);

  //2
  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Entertainment";
  categoryModel.imageURL =
      "https://images.unsplash.com/photo-1522869635100-9f4c5e86aa37?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60";

  category.add(categoryModel);

  //3
  categoryModel = new CategoryModel();
  categoryModel.categoryName = "General";
  categoryModel.imageURL =
      "https://images.unsplash.com/photo-1584359983106-ef9366f27454?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60";
  category.add(categoryModel);

  //4
  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Health";
  categoryModel.imageURL =
      "https://images.unsplash.com/photo-1490818387583-1baba5e638af?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60";
  category.add(categoryModel);

  //5
  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Science";
  categoryModel.imageURL =
      "https://images.unsplash.com/photo-1507668077129-56e32842fceb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60";
  category.add(categoryModel);

  //5
  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Sports";
  categoryModel.imageURL =
      "https://images.unsplash.com/photo-1552667466-07770ae110d0?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60";

  category.add(categoryModel);

  //6
  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Technology";
  categoryModel.imageURL =
      "https://images.unsplash.com/photo-1504384764586-bb4cdc1707b0?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60";

  category.add(categoryModel);

  return category;
}
