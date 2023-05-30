import 'package:any/src/method.dart';
import 'package:test/test.dart';

void main() {
  group('Method equals', () {
    test('GET', () => expect(Method.get, equals(Method('GET'))));
    test('HEAD', () => expect(Method.head, equals(Method('HEAD'))));
    test('POST', () => expect(Method.post, equals(Method('POST'))));
    test('PUT', () => expect(Method.put, equals(Method('PUT'))));
    test('DELETE', () => expect(Method.delete, equals(Method('DELETE'))));
    test('CONNECT', () => expect(Method.connect, equals(Method('CONNECT'))));
    test('OPTIONS', () => expect(Method.options, equals(Method('OPTIONS'))));
    test('TRACE', () => expect(Method.trace, equals(Method('TRACE'))));
    test('PATCH', () => expect(Method.patch, equals(Method('PATCH'))));
  });

  group('Invalid method', () {
    test('empty', () => expect(() => Method(''), throwsArgumentError));
    test('whitespace', () => expect(() => Method(' '), throwsArgumentError));
  });

  group('Extension method', () {
    test('foo', () => expect(Method('foo'), equals(Method('foo'))));
    test('bar', () => expect(Method('bar'), equals(Method('bar'))));
  });
}
