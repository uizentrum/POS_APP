import {
  StyleSheet,
  Text,
  View,
  SafeAreaView,
  TouchableOpacity
} from "react-native";
import React from "react";

const Category = ({ navigation, route }) => {
    const { item } = route.params;
  return (
    <SafeAreaView>
      <View>
        <Text>{item.id}</Text>
        <Text>{item.title}</Text>

        <TouchableOpacity onPress={() => navigation.goBack()}>
          <Text>go back </Text>
        </TouchableOpacity>
      </View>
    </SafeAreaView>
  );
};

export default Category;

const styles = StyleSheet.create({});
