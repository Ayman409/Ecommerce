enum InvoiceType { saleInvoice, returnInvoice }

enum OperationType { edit, add, delete }

enum InvoicesOperationType { print, searchForSaleInvoice }

enum InvoiceStatusType {
  all(''),
  notSent('NEW'),
  accepted('ACCEPTED'),
  rejected('REJECTED'),
  valid('VALID'),
  invalid('INVALID'),
  inProgress('INPROGRESS');

  final String value;

  const InvoiceStatusType(this.value);
}
