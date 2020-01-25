/**
 * They come from two Interface:
 *      java.util.Collection, java.util.Map
 *
 * java.util.Collection [I]
 *   +-- java.util.Set [I]
 *     +-- java.util.HashSet [C]
 *     +-- java.util.SortedSet [I]
 *       +-- java.util.TreeSet [C]
 *
 *   +-- java.util.List [I]
 *     +-- java.util.ArrayList [C]
 *     +-- java.util.LinkedList [C]
 *     +-- java.util.Vector [C]
 *       +-- java.util.Stack [C]
 *
 *
 * java.util.Map [I]
 *   +-- java.util.SortedMap [I]
 *     +-- java.util.TreeMap [C]
 *   +-- java.util.HashTable [C]
 *   +-- java.util.HashMap [C]
 *   +-- java.util.LinkedHashMap [C]
 *   +-- java.util.WeakHashMap [C]
 *
 *
 * Tips:
 *  -- Collection have no "get()" method, you can only do "iterator()"
 *  -- Set have same interface as Collection
 *  -- List use "get()" to get one element
 *  -- Map have "put(k, v)", "get(k)", and "containsKey()", "containsValue()"
 *     and you can use "keySet()" to get a Set of keys, "values()" to get
 *     a Collection of values
 */

import java.util.Set;
import java.util.TreeSet;
import java.util.Iterator;
import java.util.Map;
import java.util.HashMap;

public class TestCollection {
  public static void main(String[] args) {
    System.out.println("test List...");

    System.out.println("test Set...");
    Set<Integer> s = new TreeSet<Integer>();
    for (int i = 8; i > 3; i--) {
      s.add(i);
    }
    for (Iterator<Integer> i = s.iterator(); i.hasNext();) {
      System.out.print(i.next() + ",");
    }
    System.out.println();

    System.out.println("test Map...");
    Map<String, String> m = new HashMap<String, String>();
    m.put("Nick", "fox");
    m.put("Judy", "bunny");
    System.out.println(m.keySet());
    System.out.println(m.values());
  }

}

