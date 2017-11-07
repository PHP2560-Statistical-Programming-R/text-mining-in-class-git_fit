check_packages = function(names)
{
  for(name in names)
  {
    if (!(name %in% installed.packages()))
      install.packages(name, repos="http://cran.us.r-project.org")
    
    library(name, character.only=TRUE)
  }
<<<<<<< HEAD
}
=======
}
>>>>>>> 8a557eee0691aefd47967e4b8014db84d797f253
