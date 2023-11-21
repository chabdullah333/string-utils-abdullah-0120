A Flutter Package that can validate strings

## Features

#### A flutter Package that:

* Can validate string values
* Will provide accurate results

## Additional information

* Easy to use and manage
* You just have to provide your params

## Basic Usage

```

 @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
      TextButton(
          onPressed: () {
            _validateStrings("1111", context);
          },
          child: Center(child: Text('Check 1111', style: Theme.of(context).textTheme.headlineMedium))),
      TextButton(
          onPressed: () {
            _validateStrings("1221", context);
          },
          child: Center(child: Text('Check 1221', style: Theme.of(context).textTheme.headlineMedium))),
      TextButton(
          onPressed: () {
            _validateStrings("abc@gmail.com", context);
          },
          child: Center(child: Text('Check abc@gmail.com', style: Theme.of(context).textTheme.headlineMedium)))
    ])));
  }

  void _validateStrings(String givenString, BuildContext context) {
    if (StringHelperUtils.instance.isNullOrBlank(givenString: givenString)) {
      debugPrint("Value is null or empty");
    } else if (StringHelperUtils.instance.isDouble(stringToCheck: givenString)) {
      debugPrint("Value is Double");
    } else if (StringHelperUtils.instance.isInt(stringToCheck: givenString)) {
      debugPrint("Value is Int");
    } else if (StringHelperUtils.instance.isNumeric(stringValue: givenString)) {
      debugPrint("Value is Numeric");
    } else if (StringHelperUtils.instance.isValidEmail(givenEmail: givenString)) {
      debugPrint("Valid Email");
    } else if (StringHelperUtils.instance.isValidAmountValue(amountValue: givenString, allowedMaxAmount: 12345)) {
      debugPrint("Valid Amount");
    }
  }

```