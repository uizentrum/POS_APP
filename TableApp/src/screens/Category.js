import {
  StyleSheet,
  Text,
  View,
  SafeAreaView,
  TouchableOpacity,
  FlatList,
  Image,
  Dimensions
} from "react-native";
import React from "react";
import * as MENU from "../data/ItemList";
import MenuComponent from "../components/MenuComponent";
import Title from "../components/Title";
const windowWidth = Dimensions.get("window").width;
const windowHeight = Dimensions.get("window").height;

const Category = ({ navigation, route }) => {
  const item = route.params;
  return (
    <SafeAreaView>
      <View style={{flexDirection:'column'}}>
        <View>
          <Title title={"Categories list"} />
        </View>
        <View style={styles.menuContainer}>
          <Title title={"Menu List"} />

          <FlatList
            data={MENU.ItemList}
            numColumns={2}
            keyExtractor={item => item.id}
            renderItem={({ item }) =>
              <TouchableOpacity >
                <View style={styles.menuView}>
                  <MenuComponent value={item.name} price={item.price} />
                </View>
              </TouchableOpacity>}
          />
        </View>

        <View style={styles.imageContainer}>
        <TouchableOpacity onPress={()=>navigation.navigate('Cart')}>
        <Image
            style={styles.imageStyle}
            source={require("../images/cart.png")}
          />
        </TouchableOpacity>
       
        </View>
      </View>
     
    </SafeAreaView>
  );
};

export default Category;

const styles = StyleSheet.create({
  menuContainer: {
    justifyContent: "center",
    alignItems: "center",
    height:windowHeight*0.78

  },
  menuView: {
    flex:1,
    justifyContent: "center",
    alignItems: "center"
  },
  imageContainer:{
justifyContent:"center",
alignItems:'center',

  },
  imageStyle: {
    height: 64,
    width: 64
  }
});
