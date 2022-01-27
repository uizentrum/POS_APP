import 'package:equatable/equatable.dart';
import 'package:tarka/model/wishlist_model.dart';

abstract class WishlistState extends Equatable {
  const WishlistState();

  @override
  List<Object?> get props => [];
}

class WishlistLoading extends WishlistState {}

class WishlistLoadwd extends WishlistState {
  final Wishlist wishlist;

  const WishlistLoadwd({this.wishlist = const Wishlist()});

    @override
  List<Object?> get props => [wishlist];

}

class WishlistError extends WishlistState {}
