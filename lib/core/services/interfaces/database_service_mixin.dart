// class DatabaseService implements IDatabaseService {
//   @override
//   void create() {
//   }

//   @override
//   void read() {
//   }

//   @override
//   void update() {
//   }

//   @override
//   void delete() {

//   }
// }

mixin DatabaseServiceMixin {
  void create<T>(T object);
  void read<T>(int object);
  void update<T>(T object);
  void delete<T>(int object);
}
