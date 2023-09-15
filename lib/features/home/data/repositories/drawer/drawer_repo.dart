abstract interface class DrawerRepo{
  Future< ({String userImagePath, String userName})> getUserData();
}