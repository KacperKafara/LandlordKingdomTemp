import {useMutation} from "@tanstack/react-query";
import { api } from "./api";
import {useToast} from "@/components/ui/use-toast.ts";
import {useTranslation} from "react-i18next";



export const useResetOtherUserEmailAddress = () => {
    const { toast } = useToast();
    const { t } = useTranslation();
    const {mutateAsync} = useMutation({
        mutationFn: async (id : string) => {
            const response = await api.post(`/users/${id}/email-update-request`);
            return response.status;
        },
        onSettled: async (_, error) => {
            if (error) {
                toast({
                    variant: "destructive",
                    title: t("userListPage.resetUserEmailError"),
                    description: error.message,
                });
            } else {
                toast({
                    title: t("userListPage.resetUserEmailSuccess"),
                });
            }
        },
    });
    return {updateEmail: mutateAsync};
};


export const useResetMyEmailAddress = () => {
    const { toast } = useToast();
    const { t } = useTranslation();
    const {mutateAsync} = useMutation({
        mutationFn: async () => {
            const response = await api.post(`/me/update-email`);
            return response.status;
        },
        onSettled: async (_, error) => {
            if (error) {
                toast({
                    variant: "destructive",
                    title: t("userListPage.resetUserEmailError"),
                    description: error.message,
                });
            } else {
                toast({
                    title: t("userListPage.resetUserEmailSuccess"),
                });
            }
        },
    });
    return {updateEmail: mutateAsync};
};



