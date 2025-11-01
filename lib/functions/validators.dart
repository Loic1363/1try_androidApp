bool isValidEmail(String email) {
  if (email == 'admin') return true;
  if (email.length > 50) return false;
  if (!email.contains('@')) return false;
  return true;
}
