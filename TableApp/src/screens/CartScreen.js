import { StyleSheet, Text, View, SafeAreaView } from "react-native";
import React from "react";
import Title from "../components/Title";
import ButtonComponent from "../components/ButtonComponent";

const CartScreen = ({navigation}) => {
  return (
    <SafeAreaView>
    <Title  title={'Cart'}/>
      <View style={styles.container}>
     <ButtonComponent label={"go to menu"}/>
     <ButtonComponent onPress={()=> navigation.navigate('Print')} label={"print"}/>

      </View>
    </SafeAreaView>
  );
};

export default CartScreen;

const styles = StyleSheet.create({
  container:{
    flexDirection:'row',
    justifyContent:'space-around'


  }
});
