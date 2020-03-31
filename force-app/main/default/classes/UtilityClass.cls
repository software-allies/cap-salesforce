global class UtilityClass {
    global static string newUUID() {
        String key = EncodingUtil.ConvertTohex( Crypto.GenerateAESKey(128) );
        return key.SubString(0,8) + '-' + key.SubString(8,12) + '-' + key.SubString(12,16) + '-' + key.SubString(16,20) + '-' + key.substring(20);
    }
}