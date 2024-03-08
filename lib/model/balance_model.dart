import 'dart:convert';

class CardModel {
  final String cardName;
  final String cardNumber;
  final double balance;
  final String expiryDate;
  final String id;

  CardModel({
    required this.cardName,
    required this.cardNumber,
    required this.balance,
    required this.expiryDate,
    required this.id,
  });

  factory CardModel.fromJson(Map<String, dynamic> json) {
    return CardModel(
      cardName: json['card_name'],
      cardNumber: json['card_number'],
      balance: json['balance'].toDouble(),
      expiryDate: json['expiry_date'],
      id: json['id'],
    );
  }
  factory CardModel.fromJsonString(String jsonString) {
    final jsonData = jsonDecode(jsonString);
    return CardModel.fromJson(jsonData);
  }
}