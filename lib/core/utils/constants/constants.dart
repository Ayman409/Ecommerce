import 'package:flutter/services.dart';

const kLargePaddingValue = 12.0;
const kExtraSmallPaddingValue = 1.0;
const kSmallPaddingValue = 8.0;
const kExtraLargePaddingValue = 16.0;
const kPlatform =
    MethodChannel('com.crystal_mind.crystalecrmobile/native_ecr_services');
const kPriceDigitsNumber = 2;
const kTaxGovBaseUrl = 'https://api.preprod.invoicing.eta.gov.eg/api/v1';
const kTaxEnvironmentURL = 'https://preprod.invoicing.eta.gov.eg';


String? token = '';
