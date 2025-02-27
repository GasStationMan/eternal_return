package org.EternalReturn.System.ERPlayer.Gui.Inventory.UpgradeSystem.Model;

import org.EternalReturn.Util.Algorithm.NodeMap;
import org.bukkit.Material;
import org.bukkit.enchantments.Enchantment;
import org.bukkit.inventory.ItemStack;
import org.bukkit.inventory.meta.EnchantmentStorageMeta;
import org.bukkit.inventory.meta.ItemMeta;

import java.util.ArrayList;
import java.util.List;

//인챈트 북 & 인챈트를 가져와 복사하는 클래스
public class Enchanter extends NodeMap<Object> {

    protected ItemStack item;
    protected ItemStack upgrader;
    protected List<EnchantBlock> enchantmentBlockList;
    protected boolean successed;

    public void free() {
        super.free();
        if (enchantmentBlockList != null) {
            clearEnchantBlockList();
        }
        item = null;
    }

    public Enchanter() {
        super(30, 7);
        successed = false;

        this.addNodeX(Material.IRON_HELMET);
        this.addNodeX(Material.IRON_CHESTPLATE);
        this.addNodeX(Material.IRON_LEGGINGS);
        this.addNodeX(Material.IRON_BOOTS);

        this.addNodeX(Material.STONE_SWORD);
        this.addNodeX(Material.IRON_SWORD);
        this.addNodeX(Material.DIAMOND_SWORD);
        this.addNodeX(Material.NETHERITE_SWORD);

        this.addNodeX(Material.STONE_AXE);
        this.addNodeX(Material.IRON_AXE);
        this.addNodeX(Material.DIAMOND_AXE);
        this.addNodeX(Material.NETHERITE_AXE);

        this.addNodeX(Material.FISHING_ROD);
        this.addNodeX(Material.MACE);

        this.addNodeY(Enchantment.PROTECTION);
        this.addNodeY(Enchantment.PROJECTILE_PROTECTION);
        this.addNodeY(Enchantment.FIRE_PROTECTION);
        this.addNodeY(Enchantment.THORNS);
        this.addNodeY(Enchantment.SWIFT_SNEAK);
        this.addNodeY(Enchantment.SHARPNESS);
        this.addNodeY(Enchantment.SWEEPING_EDGE);

        this.setStateTable(new Boolean[][]{
                //////  IH    IC     IL     IB      SS     IS     DS     NS    SA     IA     DA     NA      FR     MC
                /*PR*/{true, true,  true,  true,  false, false, false, false, true,  false, false, false, false, false},
                /*PP*/{true, true,  true,  true,  false, false, false, false, true,  false, false, false, false, false},
                /*FP*/{true, true,  true,  true,  false, false, false, false, true,  false, false, false, false, false},
                /*TH*/{true, true,  true,  true,  false, false, false, false, true,  false, false, false, false, false},
                /*SN*/{false,false, true,  true,  true,  false, false, false, false, true,  false, false, false, false},
                /*SH*/{false,false, false, false, false, true,  true,  true,  true,  false, true,  true,  true,  true },
                /*SW*/{false,false, false, false, false, true,  true,  true,  true,  false, true,  true,  true,  true },
        });
    }

    /**
     * item이 null이면 -> null 반환 <br>
     * enchantment가 null이면 -> item 반환 <br>
     * 조건을 모두 만족하면 -> 인챈트 된 item 반환
     */
    public ItemStack enchant() {
        successed = false;
        if (item == null) {
            return null;
        }
        if (enchantmentBlockList != null) {
            for (EnchantBlock enchant : enchantmentBlockList) {
                if(! (getState(item.getType(), enchant.getEnchantment()) instanceof Boolean canEnchant)){
                    continue;
                }

                if (canEnchant) {
                    ItemMeta itemMeta = item.getItemMeta();
                    itemMeta.addEnchant(enchant.getEnchantment(), enchant.getLevel(), false);
                    item.setItemMeta(itemMeta);
                    successed = true;
                }
            }
        }
        return item;
    }


    //getter
    public boolean isSuccessed() {
        return successed;
    }

    //setter
    public void setItemNEnchantBook(ItemStack item, ItemStack enchantBook) {
        this.item = item;
        this.upgrader = enchantBook;
        this.enchantmentBlockList = extractEnchantments(enchantBook);
    }

    public void setItem(ItemStack item) {
        this.item = item;
    }

    public void setEnchantment(ItemStack enchantBook) {
        clearEnchantBlockList();
        this.enchantmentBlockList = extractEnchantments(enchantBook);
    }


    private void clearEnchantBlockList() {
        for (EnchantBlock e : enchantmentBlockList) {
            e.free();
        }
        enchantmentBlockList = null;
    }

    /**
     * 인챈트 북 아이템메타에서 인챈트 내용을 List<EnchantBlock> 형식으로 반환하는 함수
     */
    private List<EnchantBlock> extractEnchantments(ItemStack enchantBook) {

        try {
            if (enchantBook == null) { //널이라면 그냥 널 반환
                return null;
            }

            ItemMeta enchantBookMeta = enchantBook.getItemMeta();
            if (!(enchantBookMeta instanceof EnchantmentStorageMeta enchantmentStorageMeta)) {
                throw new IllegalArgumentException("인챈트 북이 아닙니다.");
            }

            List<EnchantBlock> extractedEnchantedBlock = new ArrayList<>(4);
            //인챈트 블록 리스트를 생성
            for (Enchantment enchantment : enchantmentStorageMeta.getStoredEnchants().keySet()) {
                int level = enchantmentStorageMeta.getStoredEnchantLevel(enchantment);
                extractedEnchantedBlock.add(new EnchantBlock(enchantment, level));
            }
            return extractedEnchantedBlock;
        } catch (IllegalArgumentException e) {
            e.fillInStackTrace();
            return null;
        }
    }
}
