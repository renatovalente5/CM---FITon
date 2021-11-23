import '../core.dart';

class UserService {
  User getProfile() {
    return User(
      firstname: "Renato",
      lastname: "Valente",
      email: "renato.valente@gmail.com",
      gender: "male",
      phone: "(351) 925 XXX X70",
      photoURL:
          "https://instagram.fopo5-2.fna.fbcdn.net/v/t51.2885-19/s150x150/257798171_1080393906046483_514592159066259995_n.jpg?_nc_ht=instagram.fopo5-2.fna.fbcdn.net&_nc_cat=107&_nc_ohc=XpJZ5oFBnKwAX8aWip-&tn=LpaskIcctZVHq7Jq&edm=ABfd0MgBAAAA&ccb=7-4&oh=d820268936bdf459c517be8f84d87129&oe=61A38526&_nc_sid=7bff83",
      dob: DateTime.parse("2017-03-17"),
      company: "Coding Your Life",
      address: UserAddress(
        street: "Permata Street No. 17",
        city: "Bogor",
        province: "West Java",
        country: "Indonesia",
        postalCode: "170712",
      ),
      balance: "17",
      membership: "Free",
      progress: 77,
    );
  }
}
