import 'dart:math';

import 'package:espo_crm_client/actions/api.dart';
import 'package:espo_crm_client/model/contacts_fields.dart';
import 'package:espo_crm_client/model/firebase_user.dart';

import 'package:contacts_service/contacts_service.dart';
import 'package:espo_crm_client/model/lead.dart';

/// Update contacts by phone number and remove duplicates
Future updateOrCreateContact(FullLead fullLead) async {
  final String id = fullLead.id;

  Set<Contact> contacts = Set();

  for (PhoneNumberData phone in fullLead.phoneNumberData) {
    Iterable<Contact> contactsForPhones =
        await ContactsService.getContactsForPhone(phone.phoneNumber);
    contactsForPhones.forEach(contacts.add);
  }

  if (contacts.isEmpty) {
    Contact contact = Contact();
    contact = _updateFileds(contact, fullLead);

    await ContactsService.addContact(contact);
  } else {
    Contact contact = contacts.first;
    assert(contacts.remove(contact));

    Contact updatedConcat  = _updateFileds(contact, fullLead);
    await ContactsService.updateContact(updatedConcat);

    contacts.forEach((c) async => await ContactsService.deleteContact(c));
  }

  return Future.value(null);
}

Contact _updateFileds(Contact contact, FullLead fullLead) {
  return contact
    ..displayName = fullLead.name
    ..givenName = fullLead.firstName
    ..familyName = fullLead.lastName
    ..phones = _phones(fullLead.phoneNumberData)
    ..emails = _emails(fullLead.emailAddressData);
}

Iterable<Item> _emails(List<EmailAddressData> emailAddress) {
  return emailAddress.map((email) => Item(label: "email", value: email.lower));
}

Iterable<Item> _phones(List<PhoneNumberData> phoneNumberData) {
  return phoneNumberData
      .map((phone) => Item(label: phone.type, value: phone.phoneNumber));
}
