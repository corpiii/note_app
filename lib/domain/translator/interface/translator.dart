abstract interface class Translator<From, To> {
  From translateFrom(To data);
  To translateTo(From data);
}