

function YYFMap()
{
    this.length = 0;

}
/**
 * ��YYFMap����Ӽ�ֵ��
 */
YYFMap.prototype.put = function (key, value)
{
    this[this.prefix + key] = value;
    this.length ++;
}
/**
 * ��YYFMap�л�ȡvalueֵ
 */
YYFMap.prototype.get = function(key)
{
    return typeof this[this.prefix + key] == "undefined"
        ? null : this[this.prefix + key];
}
/**
 * ��YYFMap�л�ȡ����key�ļ��ϣ���������ʽ����
 */
YYFMap.prototype.keySet = function()
{
    var arrKeySet = new Array();
    var index = 0;
    for(var strKey in this)
    {
        if(strKey.substring(0,this.prefix.length) == this.prefix)
            arrKeySet[index ++] = strKey.substring(this.prefix.length);
    }
    return arrKeySet.length == 0 ? null : arrKeySet;
}
/**
 * ��YYFMap�л�ȡvalue�ļ��ϣ���������ʽ����
 */
YYFMap.prototype.values = function()
{
    var arrValues = new Array();
    var index = 0;
    for(var strKey in this)
    {
        if(strKey.substring(0,this.prefix.length) == this.prefix)
            arrValues[index ++] = this[strKey];
    }
    return arrValues.length == 0 ? null : arrValues;
}
/**
 * ��ȡYYFMap��valueֵ����
 */
YYFMap.prototype.size = function()
{
    return this.length;
}
/**
 * ɾ��ָ����ֵ
 */
YYFMap.prototype.remove = function(key)
{
    delete this[this.prefix + key];
    this.length --;
}
/**
 * ���YYFMap
 */
YYFMap.prototype.clear = function()
{
    for(var strKey in this)
    {
        if(strKey.substring(0,this.prefix.length) == this.prefix)
            delete this[strKey];
    }
    this.length = 0;
}
/**
 * �ж�YYFMap�Ƿ�Ϊ��
 */
YYFMap.prototype.isEmpty = function()
{
    return this.length == 0;
}
/**
 * �ж�YYFMap�Ƿ����ĳ��key
 */
YYFMap.prototype.containsKey = function(key)
{
    for(var strKey in this)
    {
        if(strKey == this.prefix + key)
            return true;
    }
    return false;
}
/*
 * �ж�YYFMap�Ƿ����ĳ��value
 */
YYFMap.prototype.containsValue = function(value)
{
    for(var strKey in this)
    {
        if(this[strKey] == value)
            return true;
    }
    return false;
}
/**
 * ��һ��YYFMap��ֵ���뵽��һ��YYFMap�У�����������YYFMap
 */
YYFMap.prototype.putAll = function(map)
{
    if(map == null)
        return;
    if(map.constructor != YYFMap)
        return;
    var arrKey = map.keySet();
    var arrValue = map.values();
    for(var i in arrKey)
        this.put(arrKey[i],arrValue[i]);
}
//toString
YYFMap.prototype.toString = function()
{
    var str = "";
    for(var strKey in this)
    {
        if(strKey.substring(0,this.prefix.length) == this.prefix)
            str += strKey.substring(this.prefix.length)
                + " : " + this[strKey] + "\r\n";
    }
    return str;
}
