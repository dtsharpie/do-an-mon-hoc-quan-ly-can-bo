using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Collections;

namespace HutStaff.Common
{

    public class CacheManager
    {
        private Hashtable htlCacheData = new Hashtable();
        private static volatile CacheManager instance;
        private static object locker = new object();

        private CacheManager() { }

        public static CacheManager GetSever()
        {
            if (instance == null)
            {
                lock (locker)
                {
                    if (instance == null)
                        instance = new CacheManager();
                }
            }
            return instance;
        }

        public void SetValue(string key, object value)
        {
            if (htlCacheData.ContainsKey(key))
            {
                htlCacheData[key] = value;
            }
            else
            {
                htlCacheData.Add(key, value);
            }
        }

        public object GetValue(string key)
        {
            return htlCacheData.ContainsKey(key) ? htlCacheData[key] : null;
        }

        public bool Contains(string key)
        {
            return htlCacheData.ContainsKey(key);
        }

        public void Remove(string key)
        {
            if (htlCacheData.ContainsKey(key))
            {
                htlCacheData.Remove(key);
            }
        }

        public void RemoveAll()
        {
            htlCacheData.Clear();
        }
    }
}
